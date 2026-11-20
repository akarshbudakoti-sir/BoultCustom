package com.boultcustom;

import android.animation.ValueAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.DecelerateInterpolator;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;

import com.crrepa.band.my.device.watchface.StoreWatchFaceMainActivity;

public final class BoultHook {

    /** Last sheet dialog shown; exposed for render testing. */
    public static Dialog lastShownSheet;

    private BoultHook() {}

    private static float density(Context c) {
        return c.getResources().getDisplayMetrics().density;
    }

    private static int dp(Context c, float v) {
        return (int) (v * density(c) + 0.5f);
    }

    /** Entry point wired into BandSettingFragment.onItemChildClick for the FACE GALLERY tile. */
    public static void showFaceGallerySheet(Fragment fragment) {
        if (fragment == null) return;
        FragmentActivity activity = fragment.getActivity();
        if (activity == null || activity.isFinishing()) return;
        showSheet(activity);
    }

    public static void showSheet(final FragmentActivity activity) {
        final Dialog dialog = new Dialog(activity);
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

        final float d = density(activity);

        LinearLayout sheet = new LinearLayout(activity);
        sheet.setOrientation(LinearLayout.VERTICAL);
        int padH = (int) (24 * d);
        sheet.setPadding(padH, (int) (18 * d), padH, (int) (28 * d));

        GradientDrawable bg = new GradientDrawable();
        bg.setColor(Color.rgb(28, 30, 36));
        float radius = 24 * d;
        bg.setCornerRadii(new float[]{radius, radius, radius, radius, 0, 0, 0, 0});
        sheet.setBackground(bg);

        // drag handle
        View handle = new View(activity);
        GradientDrawable handleBg = new GradientDrawable();
        handleBg.setColor(Color.rgb(90, 94, 104));
        handleBg.setCornerRadius(4 * d);
        handle.setBackground(handleBg);
        LinearLayout.LayoutParams handleLp = new LinearLayout.LayoutParams((int) (40 * d), (int) (5 * d));
        handleLp.gravity = Gravity.CENTER_HORIZONTAL;
        handleLp.bottomMargin = (int) (16 * d);
        sheet.addView(handle, handleLp);

        TextView title = new TextView(activity);
        title.setText("BoultCustom");
        title.setTextColor(Color.WHITE);
        title.setTextSize(18);
        title.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        title.setGravity(Gravity.CENTER_HORIZONTAL);
        LinearLayout.LayoutParams titleLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        titleLp.bottomMargin = (int) (14 * d);
        sheet.addView(title, titleLp);

        sheet.addView(optionRow(activity, "Watch gallery", "Browse the built-in watch face store",
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                        try {
                            activity.startActivity(StoreWatchFaceMainActivity.getCallingIntent(activity));
                        } catch (Throwable ignored) {
                        }
                    }
                }));

        sheet.addView(optionRow(activity, "Edit", "Create a watch face from your own photos",
                new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                        try {
                            activity.startActivity(new Intent(activity, EditorActivity.class));
                        } catch (Throwable ignored) {
                        }
                    }
                }));

        dialog.setContentView(sheet);

        Window window = dialog.getWindow();
        if (window != null) {
            window.setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
            WindowManager.LayoutParams lp = window.getAttributes();
            lp.gravity = Gravity.BOTTOM;
            lp.width = WindowManager.LayoutParams.MATCH_PARENT;
            window.setAttributes(lp);
        }
        dialog.setCanceledOnTouchOutside(true);

        dialog.show();
        lastShownSheet = dialog;

        // slide-up animation
        sheet.post(new Runnable() {
            @Override
            public void run() {
                final View v = sheet;
                final int h = v.getHeight() > 0 ? v.getHeight() : 400;
                ValueAnimator anim = ValueAnimator.ofFloat(h, 0f);
                anim.setDuration(280);
                anim.setInterpolator(new DecelerateInterpolator());
                anim.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
                    @Override
                    public void onAnimationUpdate(ValueAnimator a) {
                        v.setTranslationY((Float) a.getAnimatedValue());
                    }
                });
                anim.start();
            }
        });
    }

    private static View optionRow(Context c, String title, String subtitle,
                                  View.OnClickListener listener) {
        float d = density(c);

        LinearLayout row = new LinearLayout(c);
        row.setOrientation(LinearLayout.VERTICAL);
        int p = (int) (16 * d);
        row.setPadding(p, p, p, p);
        row.setClickable(true);
        row.setOnClickListener(listener);

        GradientDrawable rowBg = new GradientDrawable();
        rowBg.setColor(Color.rgb(44, 47, 56));
        rowBg.setCornerRadius(14 * d);
        row.setBackground(rowBg);

        TextView t = new TextView(c);
        t.setText(title);
        t.setTextColor(Color.WHITE);
        t.setTextSize(16);
        t.setTypeface(android.graphics.Typeface.DEFAULT_BOLD);
        row.addView(t);

        TextView s = new TextView(c);
        s.setText(subtitle);
        s.setTextColor(Color.rgb(170, 174, 184));
        s.setTextSize(13);
        LinearLayout.LayoutParams sLp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        sLp.topMargin = (int) (2 * d);
        row.addView(s, sLp);

        LinearLayout.LayoutParams lp = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        lp.bottomMargin = (int) (12 * d);
        row.setLayoutParams(lp);
        return row;
    }
}
