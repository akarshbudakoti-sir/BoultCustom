package com.boultcustom;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;

/** A movable overlay layer on top of the photo: an analog clock or a text label. */
public abstract class Overlay {
    public float x;      // center, view coordinates
    public float y;
    public float scale = 1f;

    public abstract float radius();           // hit-test radius in view px
    public abstract void draw(Canvas canvas); // draw at (x, y) with scale

    public boolean contains(float px, float py) {
        float dx = px - x, dy = py - y;
        float r = radius() * 1.15f;
        return dx * dx + dy * dy <= r * r;
    }

    /** Analog clock overlay: photo stays the background, clock floats over it. */
    public static class Clock extends Overlay {
        public int style = AnalogClock.STYLE_MINIMAL;
        public float baseDiameter;

        public Clock(float baseDiameter) {
            this.baseDiameter = baseDiameter;
        }

        @Override
        public float radius() {
            return baseDiameter * scale / 2f;
        }

        @Override
        public void draw(Canvas canvas) {
            AnalogClock.draw(canvas, style, x, y, baseDiameter * scale);
        }

        /** Fixed-time render for export (uses current time too). */
        public void drawExport(Canvas canvas, float bx, float by, float exportScale) {
            AnalogClock.draw(canvas, style, bx, by, baseDiameter * scale * exportScale);
        }
    }

    /** Text overlay. */
    public static class Label extends Overlay {
        public String text;
        public float baseSize;

        public Label(String text, float baseSize) {
            this.text = text;
            this.baseSize = baseSize;
        }

        @Override
        public float radius() {
            return Math.max(baseSize * scale, baseSize * scale * text.length() * 0.35f);
        }

        @Override
        public void draw(Canvas canvas) {
            drawAt(canvas, x, y, 1f);
        }

        public void drawExport(Canvas canvas, float bx, float by, float exportScale) {
            drawAt(canvas, bx, by, exportScale);
        }

        private void drawAt(Canvas canvas, float px, float py, float exportScale) {
            Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
            p.setColor(Color.WHITE);
            p.setTextAlign(Paint.Align.CENTER);
            p.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
            p.setTextSize(baseSize * scale * exportScale);
            p.setShadowLayer(4f * scale * exportScale, 0, 2f * scale * exportScale, 0x80000000);
            canvas.drawText(text, px, py, p);
        }
    }
}
