package com.boultcustom;

import android.graphics.ColorMatrix;

/** ColorMatrix filter presets plus user brightness/contrast/saturation adjustments. */
public final class Filters {

    public static final String[] NAMES = {"Original", "Vivid", "Mono", "Warm", "Cool", "Fade"};

    public float brightness = 0f;   // -100 .. 100
    public float contrast = 1f;     // 0.5 .. 2.0
    public float saturation = 1f;   // 0 .. 2.0
    public int preset = 0;

    public ColorMatrix build() {
        ColorMatrix m = presetMatrix(preset);

        ColorMatrix sat = new ColorMatrix();
        sat.setSaturation(saturation);
        m.postConcat(sat);

        float c = contrast;
        float t = 128f * (1f - c) + brightness;
        ColorMatrix cb = new ColorMatrix(new float[]{
                c, 0, 0, 0, t,
                0, c, 0, 0, t,
                0, 0, c, 0, t,
                0, 0, 0, 1, 0
        });
        m.postConcat(cb);
        return m;
    }

    private static ColorMatrix presetMatrix(int preset) {
        ColorMatrix m = new ColorMatrix();
        switch (preset) {
            case 1: // Vivid
                m.setSaturation(1.6f);
                m.postConcat(contrastOf(1.1f));
                break;
            case 2: // Mono
                m.setSaturation(0f);
                break;
            case 3: // Warm
                m.set(new float[]{
                        1.12f, 0, 0, 0, 8,
                        0, 1.02f, 0, 0, 2,
                        0, 0, 0.90f, 0, -4,
                        0, 0, 0, 1, 0});
                break;
            case 4: // Cool
                m.set(new float[]{
                        0.92f, 0, 0, 0, -4,
                        0, 1.02f, 0, 0, 0,
                        0, 0, 1.12f, 0, 8,
                        0, 0, 0, 1, 0});
                break;
            case 5: // Fade
                m.setSaturation(0.85f);
                m.postConcat(contrastOf(0.85f));
                ColorMatrix lift = new ColorMatrix();
                lift.set(new float[]{
                        1, 0, 0, 0, 16,
                        0, 1, 0, 0, 16,
                        0, 0, 1, 0, 16,
                        0, 0, 0, 1, 0});
                m.postConcat(lift);
                break;
            case 0:
            default:
                break;
        }
        return m;
    }

    private static ColorMatrix contrastOf(float c) {
        float t = 128f * (1f - c);
        return new ColorMatrix(new float[]{
                c, 0, 0, 0, t,
                0, c, 0, 0, t,
                0, 0, c, 0, t,
                0, 0, 0, 1, 0});
    }
}
