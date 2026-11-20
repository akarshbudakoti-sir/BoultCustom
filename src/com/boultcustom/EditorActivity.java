package com.boultcustom;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.text.InputType;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import com.crrepa.band.my.device.watchfacenew.photo.NewCustomWatchFaceActivity;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 * BoultCustom editor, v3 layout after the user's reference:
 * X close and Save in the header, dark canvas, one Edit tool row
 * (Add photo, Clock, Text, Adjust, Rotate, Flip, Size, Del). No Retouch/Filter tabs.
 * Newest added item is drawn on top. Save exports the picture and opens the stock
 * live-clock screen; clocks and text here are frozen into the exported picture.
 */
public class EditorActivity extends Activity {

    private static final int REQ_PICK_BASE = 41;
    private static final int REQ_PICK_OVERLAY = 42;

    private EditorView editorView;

    /** Exposed for render testing. */
    public EditorView editorView() {
        return editorView;
    }
    private TextView statusText;
    private TextView diagText;
    private SeekBar adjustBar;
    private LinearLayout contextRow;
    private int contextMode; // 0 none, 1 adjust, 2 clock
    private int adjustMode; // 0 brightness, 1 contrast, 2 saturation
    private final Handler tickHandler = new Handler();
    private final Runnable ticker = new Runnable() {
        @Override
        public void run() {
            if (editorView != null && editorView.hasClockOverlay()) {
                editorView.invalidate();
            }
            tickHandler.postDelayed(this, 1000);
        }
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,
                WindowManager.LayoutParams.FLAG_FULLSCREEN);

        final float d = getResources().getDisplayMetrics().density;

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.rgb(16, 18, 22));

        // header: X close left, title, Save right
        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setPadding((int) (16 * d), (int) (12 * d), (int) (16 * d), (int) (4 * d));
        Button closeBtn = smallButton("X", d);
        closeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        header.addView(closeBtn);
        TextView title = new TextView(this);
        title.setText("BoultCustom");
        title.setTextColor(Color.WHITE);
        title.setTextSize(18);
        title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        title.setGravity(Gravity.CENTER);
        header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Button saveBtn = smallButton("Save", d);
        saveBtn.setTextColor(Color.rgb(20, 24, 28));
        GradientDrawable saveBg = new GradientDrawable();
        saveBg.setColor(Color.rgb(64, 200, 224));
        saveBg.setCornerRadius(10 * d);
        saveBtn.setBackground(saveBg);
        saveBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                exportToWatch();
            }
        });
        header.addView(saveBtn);
        root.addView(header);

        statusText = new TextView(this);
        statusText.setText("Pick a photo to start. Everything you add lands on top; drag to place it.");
        statusText.setTextColor(Color.rgb(150, 155, 166));
        statusText.setTextSize(12);
        statusText.setPadding((int) (16 * d), 0, (int) (16 * d), (int) (8 * d));
        root.addView(statusText);

        // editor canvas
        editorView = new EditorView(this);
        root.addView(editorView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // context row: adjust slider OR clock style picker
        contextRow = new LinearLayout(this);
        contextRow.setOrientation(LinearLayout.HORIZONTAL);
        contextRow.setGravity(Gravity.CENTER_VERTICAL);
        contextRow.setPadding((int) (12 * d), 0, (int) (12 * d), 0);
        contextRow.setVisibility(View.GONE);
        root.addView(contextRow);

        // tool row
        HorizontalScrollView scroll = new HorizontalScrollView(this);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setPadding((int) (8 * d), (int) (8 * d), (int) (8 * d), (int) (4 * d));
        scroll.addView(bar);
        root.addView(scroll);

        addTool(bar, "Add photo", d, new Runnable() {
            @Override
            public void run() {
                pickPhoto(editorView.getBase() == null ? REQ_PICK_BASE : REQ_PICK_OVERLAY);
            }
        });
        addTool(bar, "Clock", d, new Runnable() {
            @Override
            public void run() {
                toggleClockPanel();
            }
        });
        addTool(bar, "Text", d, new Runnable() {
            @Override
            public void run() {
                promptText();
            }
        });
        addTool(bar, "Adjust", d, new Runnable() {
            @Override
            public void run() {
                toggleAdjust();
            }
        });
        addTool(bar, "Rotate", d, new Runnable() {
            @Override
            public void run() {
                rotateBase();
            }
        });
        addTool(bar, "Flip", d, new Runnable() {
            @Override
            public void run() {
                flipBase();
            }
        });
        addTool(bar, "Size +", d, new Runnable() {
            @Override
            public void run() {
                resizeSelected(1.15f);
            }
        });
        addTool(bar, "Size -", d, new Runnable() {
            @Override
            public void run() {
                resizeSelected(0.87f);
            }
        });
        addTool(bar, "Del", d, new Runnable() {
            @Override
            public void run() {
                editorView.removeSelected();
            }
        });

        // read-only diagnostics line (watch-reported values the app has stored)
        diagText = new TextView(this);
        diagText.setTextColor(Color.rgb(110, 115, 126));
        diagText.setTextSize(10);
        diagText.setPadding((int) (16 * d), 0, (int) (16 * d), (int) (8 * d));
        root.addView(diagText);

        setContentView(root);

        // Edit opens the phone photo picker immediately
        pickPhoto(REQ_PICK_BASE);
    }

    @Override
    protected void onResume() {
        super.onResume();
        updateDiag();
        tickHandler.removeCallbacks(ticker);
        tickHandler.postDelayed(ticker, 1000);
    }

    @Override
    protected void onPause() {
        super.onPause();
        tickHandler.removeCallbacks(ticker);
    }

    private Button smallButton(String label, float d) {
        Button b = new Button(this);
        b.setText(label);
        b.setTextColor(Color.WHITE);
        b.setTextSize(13);
        b.setAllCaps(false);
        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.rgb(44, 47, 56));
        bg.setCornerRadius(10 * d);
        b.setBackground(bg);
        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.setMargins((int) (4 * d), 0, (int) (4 * d), 0);
        b.setLayoutParams(lp);
        return b;
    }

    private Button addTool(LinearLayout bar, String label, float d, final Runnable action) {
        Button b = smallButton(label, d);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                action.run();
            }
        });
        bar.addView(b);
        return b;
    }

    // ---- photo picking ----

    private void pickPhoto(int requestCode) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("image/*");
        try {
            startActivityForResult(intent, requestCode);
        } catch (Throwable t) {
            toast("No gallery app available");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null) return;
        Uri uri = data.getData();
        if (uri == null) return;
        Bitmap bmp = decodeSampled(uri, 1600);
        if (bmp == null) {
            toast("Could not read that photo");
            return;
        }
        if (requestCode == REQ_PICK_BASE || editorView.getBase() == null) {
            editorView.setBase(bmp);
            statusText.setText("Add photo layers, a clock or text. New items go on top. Save opens the live-clock screen.");
        } else if (requestCode == REQ_PICK_OVERLAY) {
            float w = Math.min(editorView.getWidth(), editorView.getHeight()) * 0.5f;
            if (w <= 0) w = 400;
            Overlay.Photo photo = new Overlay.Photo(bmp, w);
            editorView.addOverlay(photo);
            editorView.centerOverlay(photo);
            statusText.setText("Photo added on top. Drag to move, Size +/- to resize.");
        }
    }

    private Bitmap decodeSampled(Uri uri, int maxDim) {
        try {
            BitmapFactory.Options bounds = new BitmapFactory.Options();
            bounds.inJustDecodeBounds = true;
            InputStream in = getContentResolver().openInputStream(uri);
            BitmapFactory.decodeStream(in, null, bounds);
            if (in != null) in.close();
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null;

            int sample = 1;
            while (Math.max(bounds.outWidth, bounds.outHeight) / (sample * 2) >= maxDim) {
                sample *= 2;
            }
            BitmapFactory.Options opts = new BitmapFactory.Options();
            opts.inSampleSize = sample;
            InputStream in2 = getContentResolver().openInputStream(uri);
            Bitmap bmp = BitmapFactory.decodeStream(in2, null, opts);
            if (in2 != null) in2.close();
            return bmp;
        } catch (Throwable t) {
            return null;
        }
    }

    // ---- base edits ----

    private void rotateBase() {
        Bitmap base = editorView.getBase();
        if (base == null) return;
        Matrix m = new Matrix();
        m.postRotate(90);
        editorView.setBase(Bitmap.createBitmap(base, 0, 0, base.getWidth(), base.getHeight(), m, true));
    }

    private void flipBase() {
        Bitmap base = editorView.getBase();
        if (base == null) return;
        Matrix m = new Matrix();
        m.preScale(-1, 1);
        editorView.setBase(Bitmap.createBitmap(base, 0, 0, base.getWidth(), base.getHeight(), m, true));
    }

    // ---- adjust ----

    private void toggleAdjust() {
        if (contextMode != 1 || contextRow.getVisibility() == View.GONE) {
            showAdjustRow();
        } else {
            adjustMode = (adjustMode + 1) % 3;
            showAdjustRow();
        }
    }

    private void showAdjustRow() {
        String[] names = {"Brightness", "Contrast", "Saturation"};
        contextMode = 1;
        contextRow.removeAllViews();
        TextView label = new TextView(this);
        label.setText(names[adjustMode]);
        label.setTextColor(Color.WHITE);
        label.setTextSize(13);
        contextRow.addView(label);
        adjustBar = new SeekBar(this);
        adjustBar.setMax(200);
        adjustBar.setProgress(adjustMode == 0 ? (int) (editorView.filters.brightness + 100)
                : adjustMode == 1 ? (int) (editorView.filters.contrast * 100)
                : (int) (editorView.filters.saturation * 100));
        adjustBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (!fromUser) return;
                applyAdjust(progress);
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {}

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {}
        });
        contextRow.addView(adjustBar, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        contextRow.setVisibility(View.VISIBLE);
    }

    private void applyAdjust(int progress) {
        if (adjustMode == 0) {
            editorView.filters.brightness = progress - 100;
        } else if (adjustMode == 1) {
            editorView.filters.contrast = progress / 100f;
        } else {
            editorView.filters.saturation = progress / 100f;
        }
        editorView.refreshFilters();
    }

    // ---- clock ----

    private void toggleClockPanel() {
        if (editorView.getBase() == null) {
            toast("Pick a photo first");
            return;
        }
        if (contextMode == 2 && contextRow.getVisibility() == View.VISIBLE) {
            contextRow.setVisibility(View.GONE);
            contextMode = 0;
            return;
        }
        showClockRow();
    }

    private void showClockRow() {
        final float d = getResources().getDisplayMetrics().density;
        contextMode = 2;
        contextRow.removeAllViews();
        HorizontalScrollView hs = new HorizontalScrollView(this);
        hs.setHorizontalScrollBarEnabled(false);
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        hs.addView(row);
        for (int i = 0; i < AnalogClock.STYLE_COUNT; i++) {
            final int style = i;
            Button b = smallButton(AnalogClock.STYLE_NAMES[i], d);
            b.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    applyClockStyle(style, false);
                }
            });
            row.addView(b);
        }
        Button digital = smallButton("Digital", d);
        digital.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                applyClockStyle(0, true);
            }
        });
        row.addView(digital);
        Button format = smallButton("12h/24h", d);
        format.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                toggleClockFormat();
            }
        });
        row.addView(format);
        contextRow.addView(hs, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        contextRow.setVisibility(View.VISIBLE);
    }

    private void applyClockStyle(int style, boolean digital) {
        Overlay sel = editorView.selected();
        if (sel instanceof Overlay.Clock) {
            Overlay.Clock c = (Overlay.Clock) sel;
            c.digital = digital;
            if (!digital) c.style = style;
            statusText.setText(digital ? "Digital clock (frozen at export). Live time comes from the next screen."
                    : "Clock style: " + AnalogClock.STYLE_NAMES[style] + " (frozen at export).");
            editorView.invalidate();
        } else {
            float dm = Math.min(editorView.getWidth(), editorView.getHeight()) * 0.45f;
            if (dm <= 0) dm = 400;
            Overlay.Clock clock = new Overlay.Clock(dm);
            clock.digital = digital;
            if (!digital) clock.style = style;
            editorView.addOverlay(clock);
            editorView.centerOverlay(clock);
            statusText.setText("Clock added (frozen into the picture at export). The next screen adds live watch time over the photo.");
        }
    }

    private void toggleClockFormat() {
        Overlay sel = editorView.selected();
        if (sel instanceof Overlay.Clock && ((Overlay.Clock) sel).digital) {
            Overlay.Clock c = (Overlay.Clock) sel;
            c.format24 = !c.format24;
            statusText.setText(c.format24 ? "24-hour format" : "12-hour format");
            editorView.invalidate();
        } else {
            toast("Tap a digital clock first");
        }
    }

    // ---- text ----

    private void promptText() {
        if (editorView.getBase() == null) {
            toast("Pick a photo first");
            return;
        }
        final EditText input = new EditText(this);
        input.setInputType(InputType.TYPE_CLASS_TEXT);
        input.setHint("Text on the watch face");
        new AlertDialog.Builder(this)
                .setTitle("Add text")
                .setView(input)
                .setPositiveButton("Add", (dialog, which) -> {
                    String s = input.getText().toString().trim();
                    if (s.length() > 0) {
                        Overlay.Label label = new Overlay.Label(s, 56f);
                        editorView.addOverlay(label);
                        editorView.centerOverlay(label);
                    }
                })
                .setNegativeButton("Cancel", null)
                .show();
    }

    private void resizeSelected(float factor) {
        Overlay sel = editorView.selected();
        if (sel != null) {
            sel.scale = Math.max(0.3f, Math.min(3f, sel.scale * factor));
            editorView.invalidate();
        }
    }

    // ---- export ----

    private void exportToWatch() {
        if (editorView.getBase() == null) {
            toast("Pick a photo first");
            return;
        }
        try {
            Bitmap composite = editorView.renderComposite();
            File out = new File(getFilesDir(), "boultcustom_face_" + System.currentTimeMillis() + ".jpg");
            FileOutputStream fos = new FileOutputStream(out);
            composite.compress(Bitmap.CompressFormat.JPEG, 92, fos);
            fos.flush();
            fos.close();
            statusText.setText("Saved. Pick live clock style and position on the next screen.");
            startActivity(NewCustomWatchFaceActivity.getCallingIntent(this, out.getAbsolutePath()));
        } catch (Throwable t) {
            toast("Export failed: " + t.getClass().getSimpleName());
        }
    }

    // ---- read-only diagnostics ----

    /** Shows the watch-reported values the app has stored, to debug the space error. Read-only. */
    private void updateDiag() {
        StringBuilder sb = new StringBuilder("diag: ");
        try {
            android.content.SharedPreferences sp = getSharedPreferences("config", MODE_PRIVATE);
            sb.append("avail=").append(sp.getInt("available_size_custom_photo_watch_face", -1));
            sb.append(" max=").append(sp.getInt("photo_watch_face_max_count", -1));
            sb.append(" platform=").append(sp.getInt("photo_watch_face_platform", -1));
        } catch (Throwable t) {
            sb.append("prefs=?");
        }
        String tpls = null;
        SQLiteDatabase db = null;
        Cursor c = null;
        try {
            File dbFile = getDatabasePath("crrepa-db");
            if (dbFile != null && dbFile.exists()) {
                db = SQLiteDatabase.openDatabase(dbFile.getPath(), null, SQLiteDatabase.OPEN_READONLY);
                c = db.rawQuery("SELECT TPLS FROM SUPPORT_WATCH_FACE ORDER BY _id DESC LIMIT 1", null);
                if (c.moveToFirst()) {
                    tpls = c.getString(0);
                }
            }
        } catch (Throwable ignored) {
        } finally {
            if (c != null) try { c.close(); } catch (Throwable ignored) {}
            if (db != null) try { db.close(); } catch (Throwable ignored) {}
        }
        sb.append(" tpls=").append(tpls == null ? "none-stored" : tpls);
        diagText.setText(sb.toString());
    }

    private void toast(String s) {
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show();
    }
}
