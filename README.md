# BoultCustom

A modified build of GoBoult Fit (com.crrepa.band.boultfit v2.9.2-9, versionCode 21405)
that adds a custom watch-face creation flow on top of the stock app. For personal use
on the owner's Boult Watch SF (firmware MOY-7BF4-2.0.2).

## What it changes

1. **FACE GALLERY entry becomes a bottom sheet** (Watch gallery / Edit) instead of
   jumping straight into the stock face store. See `patches/`.
2. **Built-in photo editor** (`src/com/boultcustom/`): import photos as layers over the
   background, adjust (brightness/contrast/saturation), analog and digital clock and
   text overlays with newest-added-on-top ordering, export into the stock custom-face
   flow.
3. **App name** shown as "BoultCustom".
4. **Outfit Watch Face AI tab removed** from the stock custom-face screen (see
   `patches/NewCustomWatchFaceActivity.outfit-tab.patch`).

## Status

- v3 build installs over v2 on the owner's realme (Android 13). Install requires
  removing the Play Store GoBoult Fit first (same package name, different signature).
- Known v3 bug: the editor's Save hands the edited photo to the stock screen through a
  preview extra that the stock gallery ignores when it already holds photos, so the edit
  does not appear there. Fix in progress; the web preview shows the intended flow.
- Most feature flows (editor -> export -> watch transfer) are not fully tested on-device.
- The stock crop screen shows "Space is less than 0M" until the watch is connected:
  the app reads the watch's free photo-face storage over BLE and defaults to 0.

## Known platform limits (verified in the app's BLE protocol classes)

- Photo watch faces = background photos + pointer (analog hand) images + fixed-position
  widgets. There is no foreground layer, mask, or z-order field, so iPhone-style
  depth effect (live time behind foreground scenery) is NOT expressible in the
  custom-photo path.
- Editor clock overlays are static (baked into the photo). Live time on the watch comes
  from the stock flow's own widgets / "Pointer Style" analog hands.
- Full downloadable face files (MoYoung Type A/B/C binaries) are a richer format with
  ordered elements (see BUILD.md notes); that path is unexplored for this app.

## Web preview

`docs/` holds a self-contained web preview of the app flow, served by GitHub
Pages: `index.html` walks the screens (device page, FACE GALLERY sheet, demo face
gallery, the editor, and the Custom Faces screen) and `editor.html` is the
standalone editor. Use it to check editor and design changes without rebuilding
the APK. It runs fully client-side (photos never leave the browser), all watch
connection state and transfers are simulated and clearly marked, and a clock
ticking there is not proof of on-watch behavior.
The Android app remains the main build for actual watch use.

## Layout

- `docs/` - the web preview (GitHub Pages source)
- `src/com/boultcustom/` - the added Java code (compiled to classes7.dex at build time)
- `patches/` - the smali patch applied to the stock code, plus patch notes
- `rendertest/` - Robolectric render tests for the editor components (component-level
  evidence only, not device proof)
- `BUILD.md` - exact build pipeline

## Not in this repo

- The APKs, decompiled app trees, build tools, and the signing keystore are intentionally
  excluded. The signing key password lives only in the owner's password vault.
