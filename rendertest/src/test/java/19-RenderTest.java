import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.view.View;
import android.view.View.MeasureSpec;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.fragment.app.FragmentActivity;

import com.boultcustom.AnalogClock;
import com.boultcustom.BoultHook;
import com.boultcustom.EditorActivity;
import com.boultcustom.EditorView;
import com.boultcustom.Overlay;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.shadows.ShadowAlertDialog;

import java.io.File;
import java.io.FileOutputStream;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 33, manifest = Config.NONE)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class RenderTest {

    private static Bitmap photoStub(int w, int h) {
        Bitmap b = Bitmap.createBitmap(w, h, Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(b);
        Paint p = new Paint();
        p.setShader(new LinearGradient(0, 0, 0, h,
                Color.rgb(24, 62, 120), Color.rgb(210, 110, 60), Shader.TileMode.CLAMP));
        c.drawRect(0, 0, w, h, p);
        Paint s = new Paint(Paint.ANTI_ALIAS_FLAG);
        s.setColor(Color.rgb(255, 214, 140));
        c.drawCircle(w * 0.68f, h * 0.3f, w * 0.12f, s);
        return b;
    }

    private static void savePng(Bitmap bmp, String path) throws Exception {
        File out = new File(path);
        out.getParentFile().mkdirs();
        FileOutputStream fos = new FileOutputStream(out);
        bmp.compress(Bitmap.CompressFormat.PNG, 100, fos);
        fos.close();
    }

    private static void layout(View v, int w, int h) {
        v.measure(MeasureSpec.makeMeasureSpec(w, MeasureSpec.EXACTLY),
                MeasureSpec.makeMeasureSpec(h, MeasureSpec.EXACTLY));
        v.layout(0, 0, w, h);
    }

    private static View findByText(View root, String text) {
        if (root instanceof TextView && text.equals(((TextView) root).getText().toString())) {
            return root;
        }
        if (root instanceof ViewGroup) {
            ViewGroup g = (ViewGroup) root;
            for (int i = 0; i < g.getChildCount(); i++) {
                View r = findByText(g.getChildAt(i), text);
                if (r != null) return r;
            }
        }
        return null;
    }

    private static void click(View root, String text) {
        View v = findByText(root, text);
        if (v == null) throw new AssertionError("button not found: " + text);
        if (!v.performClick()) throw new AssertionError("click not handled: " + text);
    }

    /** Full-host portrait: host screen content with the sheet anchored at the bottom. */
    @Test
    public void renderBottomSheetOnHost() throws Exception {
        FragmentActivity act = Robolectric.buildActivity(FragmentActivity.class)
                .create().start().resume().get();

        // host screen content (stands in for the BandSetting device page)
        LinearLayout host = new LinearLayout(act);
        host.setOrientation(LinearLayout.VERTICAL);
        host.setBackgroundColor(Color.rgb(245, 246, 248));
        TextView t = new TextView(act);
        t.setText("Boult Watch SF (host screen)");
        t.setTextSize(22);
        t.setTextColor(Color.rgb(30, 32, 38));
        t.setPadding(60, 80, 60, 20);
        host.addView(t);
        TextView wf = new TextView(act);
        wf.setText("Watch Faces\n\n[Watch Faces 3] [Watch Faces 4] [Watch Faces 5] [FACE GALLERY]");
        wf.setTextSize(16);
        wf.setTextColor(Color.rgb(70, 74, 84));
        wf.setPadding(60, 20, 60, 20);
        host.addView(wf);
        act.setContentView(host);
        layout(host, 1080, 1920);

        BoultHook.showSheet(act);
        Dialog d = BoultHook.lastShownSheet;
        if (d == null) throw new AssertionError("sheet dialog was not recorded");
        View sheet = d.getWindow().getDecorView();
        sheet.measure(MeasureSpec.makeMeasureSpec(1080, MeasureSpec.EXACTLY),
                MeasureSpec.makeMeasureSpec(1920, MeasureSpec.UNSPECIFIED));
        int sheetH = sheet.getMeasuredHeight();
        sheet.layout(0, 0, 1080, sheetH);

        Bitmap frame = Bitmap.createBitmap(1080, 1920, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(frame);
        host.draw(canvas);
        // dialog dim + bottom-anchored sheet
        canvas.drawColor(0x66000000);
        canvas.save();
        canvas.translate(0, 1920 - sheetH);
        sheet.draw(canvas);
        canvas.restore();
        savePng(frame, "/downloads/render_sheet_host.png");
        System.out.println("SHEET_HOST_PNG_OK");
    }

    /** Editor with overlays clamped inside the photo bounds, plus export composite. */
    @Test
    public void renderEditorWithOverlays() throws Exception {
        EditorActivity act = Robolectric.buildActivity(EditorActivity.class)
                .create().start().resume().get();
        View root = act.getWindow().getDecorView();
        layout(root, 1080, 1920);

        EditorView ev = act.editorView();
        if (ev == null) throw new AssertionError("editorView missing");
        ev.setBase(photoStub(1080, 1600));
        layout(root, 1080, 1920);

        Overlay.Clock clock = new Overlay.Clock(430f);
        ev.addOverlay(clock);
        ev.centerOverlay(clock);
        clock.y = ev.photoRect().top + ev.photoRect().height() * 0.30f;

        Overlay.Label label = new Overlay.Label("Akarsh", 64f);
        ev.addOverlay(label);
        ev.centerOverlay(label);

        // deliberately shove an overlay outside the photo to prove clamping
        clock.y = -5000;
        Bitmap composite = ev.renderComposite();
        if (composite == null) throw new AssertionError("composite render failed");
        if (clock.y < ev.photoRect().top) throw new AssertionError("clamp failed: overlay escaped photo bounds");

        layout(root, 1080, 1920);
        Bitmap shot = Bitmap.createBitmap(1080, 1920, Bitmap.Config.ARGB_8888);
        root.draw(new Canvas(shot));
        savePng(shot, "/downloads/render_editor.png");

        // re-render composite after clamp for the export image
        composite = ev.renderComposite();
        savePng(composite, "/downloads/render_composite.png");
        System.out.println("EDITOR_PNG_OK");
    }

    /** Exercise the actual controls: rotate, flip, filter, adjust, text dialog, clock, style, export. */
    @Test
    public void interactionAndExportIntent() throws Exception {
        EditorActivity act = Robolectric.buildActivity(EditorActivity.class)
                .create().start().resume().get();
        View root = act.getWindow().getDecorView();
        layout(root, 1080, 1920);

        EditorView ev = act.editorView();
        ev.setBase(photoStub(1080, 1600));
        layout(root, 1080, 1920);

        click(root, "Rotate");
        if (ev.getBase().getWidth() != 1600) throw new AssertionError("rotate failed");
        click(root, "Flip");
        click(root, "Filter: Original"); // -> Vivid
        if (findByText(root, "Filter: Vivid") == null) throw new AssertionError("filter cycle failed");
        click(root, "Adjust");
        if (findByText(root, "Adjust: Brightness") == null) throw new AssertionError("adjust failed");

        click(root, "Text");
        AlertDialog dlg = ShadowAlertDialog.getLatestAlertDialog();
        if (dlg == null) throw new AssertionError("text dialog not shown");
        View dv = dlg.getWindow().getDecorView();
        EditText input = null;
        java.util.ArrayList<View> stack = new java.util.ArrayList<View>();
        stack.add(dv);
        while (!stack.isEmpty()) {
            View v = stack.remove(0);
            if (v instanceof EditText) { input = (EditText) v; break; }
            if (v instanceof ViewGroup) {
                for (int i = 0; i < ((ViewGroup) v).getChildCount(); i++) stack.add(((ViewGroup) v).getChildAt(i));
            }
        }
        if (input == null) throw new AssertionError("no EditText in dialog");
        input.setText("Boult");
        System.out.println("DBG input text now: '" + input.getText() + "'");
        dlg.getButton(DialogInterface.BUTTON_POSITIVE).performClick();
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        System.out.println("DBG overlays after text: " + ev.overlays().size());
        if (ev.overlays().size() != 1) throw new AssertionError("text overlay not added");

        click(root, "Clock (static)");
        if (ev.overlays().size() != 2) throw new AssertionError("clock overlay not added");
        click(root, "Clock style");
        click(root, "Size +");
        click(root, "Size -");

        click(root, "Next: live clock");
        org.robolectric.Shadows.shadowOf(android.os.Looper.getMainLooper()).idle();
        File dir = act.getFilesDir();
        File[] exported = dir.listFiles((d, n) -> n.startsWith("boultcustom_face_"));
        System.out.println("DBG exported files: " + (exported == null ? 0 : exported.length));
        Intent intent = Shadows.shadowOf(act).getNextStartedActivity();
        if (intent == null) throw new AssertionError("no activity started on export, toasts=" + org.robolectric.shadows.ShadowToast.getTextOfLatestToast());
        String cls = intent.getComponent() != null ? intent.getComponent().getClassName() : null;
        if (!"com.crrepa.band.my.device.watchfacenew.photo.NewCustomWatchFaceActivity".equals(cls)) {
            throw new AssertionError("wrong export target: " + cls);
        }
        String path = intent.getStringExtra("new_custom_watch_face_preview_url");
        if (path == null) throw new AssertionError("missing image extra");
        File f = new File(path);
        if (!f.exists() || f.length() == 0) throw new AssertionError("export file missing: " + path);
        BitmapFactory.Options bounds = new BitmapFactory.Options();
        bounds.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(path, bounds);
        if (bounds.outWidth <= 0) throw new AssertionError("export not a decodable image");
        System.out.println("INTENT_OK target=" + cls + " file=" + f.length() + "B " + bounds.outWidth + "x" + bounds.outHeight);
    }
}
