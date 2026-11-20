package com.crrepa.band.my.device.watchfacenew.photo;

import android.content.Context;
import android.content.Intent;

/**
 * Test double replicating the exact behavior verified in the APK's smali:
 * getCallingIntent sets the component to this class and puts the image path
 * in the "new_custom_watch_face_preview_url" extra.
 */
public class NewCustomWatchFaceActivity {
    public static Intent getCallingIntent(Context c, String url) {
        Intent i = new Intent();
        i.setClass(c, NewCustomWatchFaceActivity.class);
        i.putExtra("new_custom_watch_face_preview_url", url);
        return i;
    }
}
