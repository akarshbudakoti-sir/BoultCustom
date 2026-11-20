package com.boultcustom;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
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

/** BoultCustom photo editor: import, basic edits, filters, clock/text overlays, export to the watch-face flow. */
public class EditorActivity extends Activity {

    private static final int REQ_PICK = 41;

    private EditorView editorView;

    /** Exposed for render testing. */
    public EditorView editorView() {
        return editorView;
    }
    private TextView statusText;
    private SeekBar adjustBar;
    private LinearLayout adjustRow;
    private int adjustMode; // 0 brightness, 1 contrast, 2 saturation
    private Button filterButton;
    private Button adjustButton;

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

        // header
        LinearLayout header = new LinearLayout(this);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setPadding((int) (16 * d), (int) (12 * d), (int) (16 * d), (int) (4 * d));
        TextView title = new TextView(this);
        title.setText("BoultCustom Editor");
        title.setTextColor(Color.WHITE);
        title.setTextSize(18);
        title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        header.addView(title, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        Button closeBtn = smallButton("Close", d);
        closeBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
        header.addView(closeBtn);
        root.addView(header);

        statusText = new TextView(this);
        statusText.setText("Import a photo, style it, then Next: live clock sends it to the watch-face screen.");
        statusText.setTextColor(Color.rgb(150, 155, 166));
        statusText.setTextSize(12);
        statusText.setPadding((int) (16 * d), 0, (int) (16 * d), (int) (8 * d));
        root.addView(statusText);

        // editor canvas
        editorView = new EditorView(this);
        root.addView(editorView, new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));

        // adjust row (hidden until Adjust pressed)
        adjustRow = new LinearLayout(this);
        adjustRow.setOrientation(LinearLayout.HORIZONTAL);
        adjustRow.setGravity(android.view.Gravity.CENTER_VERTICAL);
        adjustRow.setPadding((int) (12 * d), 0, (int) (12 * d), 0);
        adjustRow.setVisibility(View.GONE);
        adjustBar = new SeekBar(this);
        adjustBar.setMax(200);
        adjustBar.setProgress(100);
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
        adjustRow.addView(adjustBar, new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(adjustRow);

        // toolbar
        HorizontalScrollView scroll = new HorizontalScrollView(this);
        scroll.setHorizontalScrollBarEnabled(false);
        LinearLayout bar = new LinearLayout(this);
        bar.setOrientation(LinearLayout.HORIZONTAL);
        bar.setPadding((int) (8 * d), (int) (8 * d), (int) (8 * d), (int) (12 * d));
        scroll.addView(bar);
        root.addView(scroll);

        addTool(bar, "Import", d, new Runnable() {
            @Override
            public void run() {
                pickPhoto();
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
        filterButton = addTool(bar, "Filter: Original", d, new Runnable() {
            @Override
            public void run() {
                cycleFilter();
            }
        });
        adjustButton = addTool(bar, "Adjust", d, new Runnable() {
            @Override
            public void run() {
                cycleAdjust();
            }
        });
        addTool(bar, "Text", d, new Runnable() {
            @Override
            public void run() {
                promptText();
            }
        });
        addTool(bar, "Clock (static)", d, new Runnable() {
            @Override
            public void run() {
                addClock();
            }
        });
        addTool(bar, "Clock style", d, new Runnable() {
            @Override
            public void run() {
                cycleClockStyle();
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
        Button exportBtn = smallButton("Next: live clock", d);
        exportBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                exportToWatch();
            }
        });
        bar.addView(exportBtn);

        setContentView(root);
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

    private void pickPhoto() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("image/*");
        try {
            startActivityForResult(intent, REQ_PICK);
        } catch (Throwable t) {
            toast("No gallery app available");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQ_PICK && resultCode == RESULT_OK && data != null) {
            Uri uri = data.getData();
            if (uri != null) {
                Bitmap bmp = decodeSampled(uri, 1600);
                if (bmp != null) {
                    editorView.setBase(bmp);
                    statusText.setText("Drag items to place them. Overlays stay inside the photo. Then Next: live clock.");
                } else {
                    toast("Could not read that photo");
                }
            }
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

    private void cycleFilter() {
        editorView.filters.preset = (editorView.filters.preset + 1) % Filters.NAMES.length;
        filterButton.setText("Filter: " + Filters.NAMES[editorView.filters.preset]);
        editorView.refreshFilters();
    }

    private void cycleAdjust() {
        String[] names = {"Brightness", "Contrast", "Saturation"};
        if (adjustRow.getVisibility() == View.GONE) {
            adjustRow.setVisibility(View.VISIBLE);
        } else {
            adjustMode = (adjustMode + 1) % 3;
        }
        adjustButton.setText("Adjust: " + names[adjustMode]);
        adjustBar.setProgress(adjustMode == 0 ? (int) (editorView.filters.brightness + 100)
                : adjustMode == 1 ? (int) (editorView.filters.contrast * 100)
                : (int) (editorView.filters.saturation * 100));
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

    private void promptText() {
        if (editorView.getBase() == null) {
            toast("Import a photo first");
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

    private void addClock() {
        if (editorView.getBase() == null) {
            toast("Import a photo first");
            return;
        }
        float d = Math.min(editorView.getWidth(), editorView.getHeight()) * 0.45f;
        if (d <= 0) d = 400;
        Overlay.Clock clock = new Overlay.Clock(d);
        editorView.addOverlay(clock);
        editorView.centerOverlay(clock);
        statusText.setText("Static clock added (frozen into the picture at export). The next screen adds live watch hands over the photo.");
    }

    private void cycleClockStyle() {
        Overlay sel = editorView.selected();
        if (sel instanceof Overlay.Clock) {
            Overlay.Clock c = (Overlay.Clock) sel;
            c.style = (c.style + 1) % AnalogClock.STYLE_COUNT;
            statusText.setText("Clock style: " + AnalogClock.STYLE_NAMES[c.style]);
            editorView.invalidate();
        } else {
            toast("Tap a clock first");
        }
    }

    private void resizeSelected(float factor) {
        Overlay sel = editorView.selected();
        if (sel != null) {
            sel.scale = Math.max(0.3f, Math.min(3f, sel.scale * factor));
            editorView.invalidate();
        }
    }

    private void exportToWatch() {
        if (editorView.getBase() == null) {
            toast("Import a photo first");
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

    private void toast(String s) {
        Toast.makeText(this, s, Toast.LENGTH_SHORT).show();
    }
}
