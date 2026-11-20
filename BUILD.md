# Build pipeline (v2)

Exact steps used to produce BoultCustom-v2.apk (110,705,051 bytes,
sha256 9f8b65ad56424bfe8d0617f1fa38199f3499e7bdd16eea39205035a89f3fe502).

## Inputs

- Full split set for com.crrepa.band.boultfit v2.9.2-9 from APKPure XAPK
  (base.apk + config.arm64_v8a.apk + config.en.apk + config.xxhdpi.apk),
  all signed by Boult's genuine certificate. base.apk sha256
  b2d5a55cc0d212928702bfb283747e8f7e3099ac457c01b62d107f969bb01c9d.
- The base alone is NOT a complete app: 27 native libraries live in the
  config.arm64_v8a split and standalone base-only installs fail.

## Tools

- REAndroid APKEditor 1.4.3 (merge splits)
- apktool (decode/build)
- Android SDK build-tools android-14: d8, aapt2, zipalign, apksigner
- JDK + dx/d8 for compiling the added sources

## Steps

1. Merge splits into one standalone APK:
   `java -jar APKEditor.jar m -i <xapk-extract-dir> -o goboult-merged.apk`
   Verify: 0 vending/stamp/SplitTypes markers in binary manifest,
   native-code 'arm64-v8a' in badging, all .so entries Stored.
2. Decode: `apktool d goboult-merged.apk -o decoded`
3. Apply patches (see patches/):
   a. AndroidManifest.xml: set application android:name to the app's own
      com.crrepa.band.my.App (the merged package must boot the app's own
      entry class directly)
   b. AndroidManifest.xml: declare com.boultcustom.EditorActivity
   c. res/values/strings.xml: app_name -> BoultCustom
   d. Replace smali_classes3/com/crrepa/band/my/home/device/BandSettingFragment.smali
      with patches/BandSettingFragment.smali (FACE GALLERY entry calls
      Lcom/boultcustom/BoultHook;->showFaceGallerySheet)
4. Add 'so' to apktool.yml doNotCompress so native libs stay STORED.
5. Compile src/com/boultcustom/*.java against android.jar + stock stubs,
   dex to classes7.dex.
6. Build: `apktool b decoded -o candidate.apk`, then add classes7.dex to the
   zip uncompressed (`zip -0 -X candidate.apk classes7.dex`).
7. Align: `zipalign -p -f 4 candidate.apk aligned.apk` (-p page-aligns .so).
8. Sign: `apksigner sign --ks <keystore> --ks-pass file:<pwfile> aligned.apk`
   (v1+v2+v3). Keystore is NOT in this repo.

## Verify before delivery

- `zipalign -c -p 4` passes; `unzip -t` passes
- `aapt2 dump badging`: label BoultCustom, versionCode 21405, native-code arm64-v8a
- `aapt2 dump xmltree --file AndroidManifest.xml`: App class + EditorActivity present
- permissions identical to the untouched merged original (`aapt2 dump permissions`)
- 27 lib/arm64-v8a/*.so entries, all Stored

## MoYoung full-face format notes (community RE, for the depth-effect question)

- Gadgetbridge documents the Moyoung BLE protocol; dawft/dawfu (david47k) and
  DaFit Canvas (e-labInnovations) document the Type A/B/C face binaries:
  RGB565 bitmaps, ordered element list (background, digit sets, progress bars,
  analog hands, static images). Element order acts as z-order (HAND_PIN_UPPER
  exists to occlude analog hands), which the custom-photo path lacks.
- Catalogue API: https://api-cdn.moyoung.com/faces/v3/list (params tpls, fv
  e.g. MOY-7BF4-2.0.2, per_page, p, tag_id, tested, lang).
