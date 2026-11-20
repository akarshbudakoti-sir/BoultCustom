package com.boultcustom;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;

/**
 * A movable overlay layer on top of the photo: an analog or digital clock, a text label,
 * or an added photo. Paint order follows insertion order, so the newest added item
 * is always drawn on top.
 */
public abstract class Overlay {
    public float x;      // center, view coordinates
    public float y;
    public float scale = 1f;

    public abstract float radius();           // hit-test radius in view px
    public abstract void draw(Canvas canvas); // draw at (x, y) with scale

    /** Draw at export resolution; (bx, by) is the center in bitmap coordinates. */
    public abstract void drawExport(Canvas canvas, float bx, float by, float exportScale);

    public boolean contains(float px, float py) {
        float dx = px - x, dy = py - y;
        float r = radius() * 1.15f;
        return dx * dx + dy * dy <= r * r;
    }

    /** Clock overlay: analog (4 styles) or digital (12h/24h). Floats over the photo. */
    public static class Clock extends Overlay {
        public int style = AnalogClock.STYLE_MINIMAL;
        public boolean digital;
        public boolean format24 = true;
        public float baseDiameter;

        public Clock(float baseDiameter) {
            this.baseDiameter = baseDiameter;
        }

        @Override
        public float radius() {
            if (digital) {
                return DigitalClock.halfWidth(baseDiameter * 0.35f, format24) * scale;
            }
            return baseDiameter * scale / 2f;
        }

        @Override
        public void draw(Canvas canvas) {
            if (digital) {
                DigitalClock.draw(canvas, x, y, baseDiameter * 0.35f * scale, format24);
            } else {
                AnalogClock.draw(canvas, style, x, y, baseDiameter * scale);
            }
        }

        @Override
        public void drawExport(Canvas canvas, float bx, float by, float exportScale) {
            if (digital) {
                DigitalClock.draw(canvas, bx, by, baseDiameter * 0.35f * scale * exportScale, format24);
            } else {
                AnalogClock.draw(canvas, style, bx, by, baseDiameter * scale * exportScale);
            }
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

        @Override
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

    /** An added photo layered over the background (and over anything added before it). */
    public static class Photo extends Overlay {
        public final Bitmap bitmap;
        /** Width in view px at scale 1. */
        public float baseWidth;

        public Photo(Bitmap bitmap, float baseWidth) {
            this.bitmap = bitmap;
            this.baseWidth = baseWidth;
        }

        @Override
        public float radius() {
            float aspect = bitmap.getHeight() / (float) Math.max(1, bitmap.getWidth());
            float halfW = baseWidth * scale / 2f;
            float halfH = halfW * aspect;
            return (float) Math.sqrt(halfW * halfW + halfH * halfH) * 0.75f;
        }

        @Override
        public void draw(Canvas canvas) {
            drawAt(canvas, x, y, 1f);
        }

        @Override
        public void drawExport(Canvas canvas, float bx, float by, float exportScale) {
            drawAt(canvas, bx, by, exportScale);
        }

        private void drawAt(Canvas canvas, float px, float py, float exportScale) {
            float w = baseWidth * scale * exportScale;
            float aspect = bitmap.getHeight() / (float) Math.max(1, bitmap.getWidth());
            float h = w * aspect;
            Paint p = new Paint(Paint.ANTI_ALIAS_FLAG | Paint.FILTER_BITMAP_FLAG);
            android.graphics.RectF dst = new android.graphics.RectF(
                    px - w / 2f, py - h / 2f, px + w / 2f, py + h / 2f);
            canvas.drawBitmap(bitmap, null, dst, p);
        }
    }
}
