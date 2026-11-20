package com.boultcustom;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;

import java.util.Calendar;
import java.util.Locale;

/** Renders a digital time overlay (HH:MM, 12h or 24h) like the web preview's digital clock. */
public final class DigitalClock {

    private DigitalClock() {}

    /** Draws the current time centered at (cx, cy). size is the nominal text height in px. */
    public static void draw(Canvas canvas, float cx, float cy, float size, boolean format24) {
        Calendar now = Calendar.getInstance();
        int hour = now.get(Calendar.HOUR_OF_DAY);
        int minute = now.get(Calendar.MINUTE);
        draw(canvas, cx, cy, size, format24, hour, minute);
    }

    public static void draw(Canvas canvas, float cx, float cy, float size, boolean format24,
                            int hour24, int minute) {
        String text;
        String ampm = null;
        if (format24) {
            text = String.format(Locale.US, "%02d:%02d", hour24, minute);
        } else {
            int h = hour24 % 12;
            if (h == 0) h = 12;
            text = String.format(Locale.US, "%d:%02d", h, minute);
            ampm = hour24 < 12 ? "AM" : "PM";
        }

        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(Color.WHITE);
        p.setTextAlign(Paint.Align.CENTER);
        p.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
        p.setTextSize(size);
        p.setShadowLayer(size * 0.08f, 0, size * 0.03f, 0x80000000);

        Paint.FontMetrics fm = p.getFontMetrics();
        float baseline = cy - (fm.ascent + fm.descent) / 2f;

        if (ampm == null) {
            canvas.drawText(text, cx, baseline, p);
        } else {
            // shrink the AM/PM suffix and keep the pair centered as one unit
            float timeWidth = p.measureText(text);
            Paint suffix = new Paint(p);
            suffix.setTextSize(size * 0.35f);
            float suffixWidth = suffix.measureText(ampm) + size * 0.08f;
            float total = timeWidth + suffixWidth;
            float left = cx - total / 2f;
            Paint leftAligned = new Paint(p);
            leftAligned.setTextAlign(Paint.Align.LEFT);
            canvas.drawText(text, left, baseline, leftAligned);
            Paint suffixLeft = new Paint(suffix);
            suffixLeft.setTextAlign(Paint.Align.LEFT);
            canvas.drawText(ampm, left + timeWidth + size * 0.08f, baseline, suffixLeft);
        }
    }

    /** Approximate half-width of the rendered time, for hit-testing and clamping. */
    public static float halfWidth(float size, boolean format24) {
        // 24h: "00:00" ~ 5 glyphs; 12h: "12:00 AM" ~ 5 glyphs + suffix
        return size * (format24 ? 1.55f : 1.85f);
    }
}
