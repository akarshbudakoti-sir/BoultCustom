package com.boultcustom;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.view.MotionEvent;
import android.view.View;

import java.util.ArrayList;
import java.util.List;

/** Canvas view: photo layer at the bottom, overlay layers (clocks, text) on top. */
public class EditorView extends View {

    private Bitmap base;
    private final Paint basePaint = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
    private final Matrix fitMatrix = new Matrix();
    private final Paint selectedRing = new Paint(Paint.ANTI_ALIAS_FLAG);
    private final List<Overlay> overlays = new ArrayList<Overlay>();
    private Overlay selected;
    private float lastTouchX, lastTouchY;
    private boolean dragging;

    public final Filters filters = new Filters();

    public EditorView(Context context) {
        super(context);
        selectedRing.setStyle(Paint.Style.STROKE);
        selectedRing.setColor(0xFFFFFFFF);
        selectedRing.setStrokeWidth(3f);
    }

    public void setBase(Bitmap bitmap) {
        base = bitmap;
        computeFit();
        for (Overlay o : overlays) clampToPhoto(o);
        invalidate();
    }

    /** Photo bounds in view coordinates (fit-center inside this view). */
    public android.graphics.RectF photoRect() {
        android.graphics.RectF r = new android.graphics.RectF();
        if (base == null || getWidth() == 0 || getHeight() == 0) return r;
        float s = fitScale();
        r.left = fitOffsetX();
        r.top = fitOffsetY();
        r.right = r.left + base.getWidth() * s;
        r.bottom = r.top + base.getHeight() * s;
        return r;
    }

    private void clampToPhoto(Overlay o) {
        android.graphics.RectF r = photoRect();
        if (r.isEmpty()) return;
        float m = Math.min(o.radius(), Math.min(r.width(), r.height()) / 2f);
        float left = r.left + m, right = r.right - m, top = r.top + m, bottom = r.bottom - m;
        if (left > right) { left = r.centerX(); right = left; }
        if (top > bottom) { top = r.centerY(); bottom = top; }
        if (o.x < left) o.x = left;
        if (o.x > right) o.x = right;
        if (o.y < top) o.y = top;
        if (o.y > bottom) o.y = bottom;
    }

    public Bitmap getBase() {
        return base;
    }

    public List<Overlay> overlays() {
        return overlays;
    }

    public Overlay selected() {
        return selected;
    }

    public void addOverlay(Overlay o) {
        overlays.add(o);
        selected = o;
        invalidate();
    }

    public void removeSelected() {
        if (selected != null) {
            overlays.remove(selected);
            selected = null;
            invalidate();
        }
    }

    public void centerOverlay(Overlay o) {
        o.x = getWidth() / 2f;
        o.y = getHeight() / 2f;
        invalidate();
    }

    public void refreshFilters() {
        basePaint.setColorFilter(new ColorMatrixColorFilter(filters.build()));
        invalidate();
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        computeFit();
    }

    private void computeFit() {
        if (base == null || getWidth() == 0 || getHeight() == 0) return;
        float scale = Math.min(getWidth() / (float) base.getWidth(),
                getHeight() / (float) base.getHeight());
        float dx = (getWidth() - base.getWidth() * scale) / 2f;
        float dy = (getHeight() - base.getHeight() * scale) / 2f;
        fitMatrix.reset();
        fitMatrix.setScale(scale, scale);
        fitMatrix.postTranslate(dx, dy);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        canvas.drawColor(Color.BLACK);
        if (base == null) {
            Paint hint = new Paint(Paint.ANTI_ALIAS_FLAG);
            hint.setColor(0xFF9AA0AA);
            hint.setTextAlign(Paint.Align.CENTER);
            hint.setTextSize(48f);
            canvas.drawText("Import a photo to start", getWidth() / 2f, getHeight() / 2f, hint);
            return;
        }
        canvas.drawBitmap(base, fitMatrix, basePaint);
        android.graphics.RectF bounds = photoRect();
        if (!bounds.isEmpty()) {
            android.graphics.Paint frame = new android.graphics.Paint();
            frame.setStyle(android.graphics.Paint.Style.STROKE);
            frame.setColor(0x40FFFFFF);
            frame.setStrokeWidth(2f);
            canvas.drawRect(bounds, frame);
        }
        for (Overlay o : overlays) {
            o.draw(canvas);
            if (o == selected) {
                canvas.drawCircle(o.x, o.y, o.radius() * 1.15f, selectedRing);
            }
        }
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getActionMasked()) {
            case MotionEvent.ACTION_DOWN:
                selected = null;
                for (int i = overlays.size() - 1; i >= 0; i--) {
                    Overlay o = overlays.get(i);
                    if (o.contains(event.getX(), event.getY())) {
                        selected = o;
                        break;
                    }
                }
                dragging = selected != null;
                lastTouchX = event.getX();
                lastTouchY = event.getY();
                invalidate();
                return true;
            case MotionEvent.ACTION_MOVE:
                if (dragging && selected != null) {
                    selected.x += event.getX() - lastTouchX;
                    selected.y += event.getY() - lastTouchY;
                    clampToPhoto(selected);
                    lastTouchX = event.getX();
                    lastTouchY = event.getY();
                    invalidate();
                }
                return true;
            case MotionEvent.ACTION_UP:
            case MotionEvent.ACTION_CANCEL:
                dragging = false;
                return true;
        }
        return super.onTouchEvent(event);
    }

    /**
     * Renders the composite at the base bitmap's full resolution.
     * Overlay positions are mapped from view space back into bitmap space.
     */
    public Bitmap renderComposite() {
        if (base == null) return null;
        Bitmap out = Bitmap.createBitmap(base.getWidth(), base.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(out);
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
        p.setColorFilter(new ColorMatrixColorFilter(filters.build()));
        canvas.drawBitmap(base, 0, 0, p);

        float viewScale = fitScale();
        float offX = fitOffsetX();
        float offY = fitOffsetY();
        float exportScale = 1f / viewScale;

        for (Overlay o : overlays) {
            clampToPhoto(o);
            float bx = (o.x - offX) * exportScale;
            float by = (o.y - offY) * exportScale;
            if (o instanceof Overlay.Clock) {
                ((Overlay.Clock) o).drawExport(canvas, bx, by, exportScale);
            } else if (o instanceof Overlay.Label) {
                ((Overlay.Label) o).drawExport(canvas, bx, by, exportScale);
            }
        }
        return out;
    }

    private float fitScale() {
        if (base == null || getWidth() == 0 || getHeight() == 0) return 1f;
        return Math.min(getWidth() / (float) base.getWidth(), getHeight() / (float) base.getHeight());
    }

    private float fitOffsetX() {
        return (getWidth() - base.getWidth() * fitScale()) / 2f;
    }

    private float fitOffsetY() {
        return (getHeight() - base.getHeight() * fitScale()) / 2f;
    }
}
