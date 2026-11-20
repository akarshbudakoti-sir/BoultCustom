# Patches

Four patches are applied to the decoded stock app (see BUILD.md step 3):

1. **Manifest application class**: set android:name to the app's own
   com.crrepa.band.my.App so the merged standalone package boots the app
   directly (needed after merging the split set).
2. **Manifest EditorActivity declaration**: registers com.boultcustom.EditorActivity
   (exported=false) so the editor can be launched from inside the app.
3. **strings.xml app_name**: GoBoult Fit -> BoultCustom.
4. **BandSettingFragment.smali** (this directory, drop-in replacement for
   smali_classes3/com/crrepa/band/my/home/device/BandSettingFragment.smali):
   the FACE GALLERY row's click no longer launches the stock
   StoreWatchFaceMainActivity; it calls
   `Lcom/boultcustom/BoultHook;->showFaceGallerySheet(Landroidx/fragment/app/Fragment;)V`
   which shows the Watch gallery / Edit bottom sheet. Everything else in the
   file is byte-identical to stock.
