package com.boultcustom;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Typeface;

import java.util.Calendar;

/** Renders analog clock faces into a bitmap cache. Several visual styles. */
public final class AnalogClock {

    public static final int STYLE_MINIMAL = 0;
    public static final int STYLE_CLASSIC = 1;
    public static final int STYLE_MODERN = 2;
    public static final int STYLE_NUMBERS = 3;
    public static final int STYLE_COUNT = 4;

    public static final String[] STYLE_NAMES = {"Minimal", "Classic", "Modern", "Numbers"};

    /** Draws the clock for the current time, centered at (cx, cy) with diameter d. */
    public static void draw(Canvas canvas, int style, float cx, float cy, float d) {
        Calendar now = Calendar.getInstance();
        int hour = now.get(Calendar.HOUR);
        int minute = now.get(Calendar.MINUTE);
        int second = now.get(Calendar.SECOND);
        draw(canvas, style, cx, cy, d, hour, minute, second);
    }

    public static void draw(Canvas canvas, int style, float cx, float cy, float d,
                            int hour, int minute, int second) {
        float r = d / 2f;

        Paint fill = new Paint(Paint.ANTI_ALIAS_FLAG);
        Paint stroke = new Paint(Paint.ANTI_ALIAS_FLAG);
        stroke.setStyle(Paint.Style.STROKE);
        Paint text = new Paint(Paint.ANTI_ALIAS_FLAG);
        text.setTextAlign(Paint.Align.CENTER);
        text.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));

        switch (style) {
            case STYLE_CLASSIC: {
                // translucent dark face
                fill.setColor(0xB312151C);
                canvas.drawCircle(cx, cy, r, fill);
                stroke.setColor(0xFFFFFFFF);
                stroke.setStrokeWidth(d * 0.012f);
                canvas.drawCircle(cx, cy, r - stroke.getStrokeWidth(), stroke);
                drawTicks(canvas, cx, cy, r, 0xFFFFFFFF, true);
                drawQuarterNumerals(canvas, text, cx, cy, r, 0xFFFFFFFF);
                drawHands(canvas, cx, cy, r, hour, minute, second, 0xFFFFFFFF, 0xFFFF7043, d);
                break;
            }
            case STYLE_MODERN: {
                // no face: ticks and bold hands only
                drawDots(canvas, cx, cy, r, 0xCCFFFFFF);
                drawQuarterTicks(canvas, cx, cy, r, 0xFFFFFFFF, d);
                drawHands(canvas, cx, cy, r, hour, minute, -1, 0xFFFFFFFF, 0, d);
                break;
            }
            case STYLE_NUMBERS: {
                fill.setColor(0x8010151C);
                canvas.drawCircle(cx, cy, r, fill);
                drawAllNumerals(canvas, text, cx, cy, r, 0xFFFFFFFF);
                drawHands(canvas, cx, cy, r, hour, minute, second, 0xFFFFFFFF, 0xFFFF5252, d);
                break;
            }
            case STYLE_MINIMAL:
            default: {
                stroke.setColor(0x99FFFFFF);
                stroke.setStrokeWidth(d * 0.010f);
                canvas.drawCircle(cx, cy, r - stroke.getStrokeWidth(), stroke);
                drawTicks(canvas, cx, cy, r, 0xCCFFFFFF, false);
                drawHands(canvas, cx, cy, r, hour, minute, second, 0xFFFFFFFF, 0xFFFF5252, d);
                break;
            }
        }
    }

    private static void drawTicks(Canvas canvas, float cx, float cy, float r, int color, boolean bold) {
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(color);
        p.setStrokeWidth(bold ? r * 0.035f : r * 0.02f);
        for (int i = 0; i < 12; i++) {
            double a = Math.toRadians(i * 30);
            float inner = r * (bold ? 0.80f : 0.85f);
            float outer = r * 0.93f;
            canvas.drawLine(
                    cx + (float) (inner * Math.sin(a)), cy - (float) (inner * Math.cos(a)),
                    cx + (float) (outer * Math.sin(a)), cy - (float) (outer * Math.cos(a)), p);
        }
    }

    private static void drawDots(Canvas canvas, float cx, float cy, float r, int color) {
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(color);
        for (int i = 0; i < 12; i++) {
            if (i % 3 == 0) continue;
            double a = Math.toRadians(i * 30);
            canvas.drawCircle(cx + (float) (r * 0.85f * Math.sin(a)),
                    cy - (float) (r * 0.85f * Math.cos(a)), r * 0.018f, p);
        }
    }

    private static void drawQuarterTicks(Canvas canvas, float cx, float cy, float r, int color, float d) {
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(color);
        p.setStrokeWidth(d * 0.016f);
        p.setStrokeCap(Paint.Cap.ROUND);
        for (int i = 0; i < 4; i++) {
            double a = Math.toRadians(i * 90);
            canvas.drawLine(
                    cx + (float) (r * 0.76f * Math.sin(a)), cy - (float) (r * 0.76f * Math.cos(a)),
                    cx + (float) (r * 0.90f * Math.sin(a)), cy - (float) (r * 0.90f * Math.cos(a)), p);
        }
    }

    private static void drawQuarterNumerals(Canvas canvas, Paint text, float cx, float cy, float r, int color) {
        text.setColor(color);
        text.setTextSize(r * 0.30f);
        String[] labels = {"12", "3", "6", "9"};
        for (int i = 0; i < 4; i++) {
            double a = Math.toRadians(i * 90);
            float tx = cx + (float) (r * 0.62f * Math.sin(a));
            float ty = cy - (float) (r * 0.62f * Math.cos(a)) + text.getTextSize() * 0.35f;
            canvas.drawText(labels[i], tx, ty, text);
        }
    }

    private static void drawAllNumerals(Canvas canvas, Paint text, float cx, float cy, float r, int color) {
        text.setColor(color);
        text.setTextSize(r * 0.20f);
        for (int i = 1; i <= 12; i++) {
            double a = Math.toRadians(i * 30);
            float tx = cx + (float) (r * 0.72f * Math.sin(a));
            float ty = cy - (float) (r * 0.72f * Math.cos(a)) + text.getTextSize() * 0.35f;
            canvas.drawText(String.valueOf(i), tx, ty, text);
        }
    }

    private static void drawHands(Canvas canvas, float cx, float cy, float r,
                                  int hour, int minute, int second,
                                  int handColor, int secondColor, float d) {
        Paint p = new Paint(Paint.ANTI_ALIAS_FLAG);
        p.setColor(handColor);
        p.setStrokeCap(Paint.Cap.ROUND);

        double hourAngle = Math.toRadians((hour + minute / 60.0) * 30.0);
        double minuteAngle = Math.toRadians((minute + second / 60.0) * 6.0);

        // hour hand
        p.setStrokeWidth(d * 0.030f);
        canvas.drawLine(cx, cy,
                cx + (float) (r * 0.45f * Math.sin(hourAngle)),
                cy - (float) (r * 0.45f * Math.cos(hourAngle)), p);

        // minute hand
        p.setStrokeWidth(d * 0.020f);
        canvas.drawLine(cx, cy,
                cx + (float) (r * 0.68f * Math.sin(minuteAngle)),
                cy - (float) (r * 0.68f * Math.cos(minuteAngle)), p);

        // second hand
        if (second >= 0) {
            p.setColor(secondColor);
            p.setStrokeWidth(d * 0.008f);
            double secondAngle = Math.toRadians(second * 6.0);
            canvas.drawLine(
                    cx - (float) (r * 0.12f * Math.sin(secondAngle)),
                    cy + (float) (r * 0.12f * Math.cos(secondAngle)),
                    cx + (float) (r * 0.76f * Math.sin(secondAngle)),
                    cy - (float) (r * 0.76f * Math.cos(secondAngle)), p);
        }

        // center dot
        Paint dot = new Paint(Paint.ANTI_ALIAS_FLAG);
        dot.setColor(handColor);
        canvas.drawCircle(cx, cy, d * 0.018f, dot);
    }
}
