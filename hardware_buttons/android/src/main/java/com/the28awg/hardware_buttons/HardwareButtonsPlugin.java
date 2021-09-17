package com.the28awg.hardware_buttons;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.PixelFormat;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import android.view.KeyEvent;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.PluginRegistry;

@SuppressWarnings({"unused", "RedundantSuppression"})
public class HardwareButtonsPlugin implements FlutterPlugin,
        ActivityAware,
        EventChannel.StreamHandler,
        PluginRegistry.ActivityResultListener {
    private static final String HARDWARE_BUTTONS_CHANNEL_NAME = "com.the28awg.hardware_buttons";
    private static final int REQUEST_CODE_OVERLAY_PERMISSION = 1000;
    private EventChannel eventChannel;
    private Activity activity;
    private EventChannel.EventSink events;
    private KeyWatcher keyWatcher;
    private boolean userDeniedDrawOverlaysPermission = false;
    private Context applicationContext;

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        applicationContext = binding.getApplicationContext();
        this.eventChannel = new EventChannel(
                binding.getBinaryMessenger(),
                HARDWARE_BUTTONS_CHANNEL_NAME
        );
        this.eventChannel.setStreamHandler(this);
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        detachKeyWatcher();
        this.eventChannel.setStreamHandler(null);
        this.eventChannel = null;
        this.applicationContext = null;
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        binding.addActivityResultListener(this);
        attachKeyWatcherIfNeeded();
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        detachKeyWatcher();
        this.activity = null;
        userDeniedDrawOverlaysPermission = false;
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        detachKeyWatcher();
        this.activity = binding.getActivity();
        binding.addActivityResultListener(this);
        attachKeyWatcherIfNeeded();
    }

    @Override
    public void onDetachedFromActivity() {
        detachKeyWatcher();
        this.activity = null;
        userDeniedDrawOverlaysPermission = false;
    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.events = events;
        attachKeyWatcherIfNeeded();
    }

    @Override
    public void onCancel(Object arguments) {
        detachKeyWatcher();
        this.events = null;
    }

    private void attachKeyWatcherIfNeeded() {
        if (this.events != null && keyWatcher == null && !userDeniedDrawOverlaysPermission && activity != null && applicationContext != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(applicationContext)) {
                Intent intent = new Intent(
                        Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                        Uri.parse("package:" + applicationContext.getPackageName())
                );
                activity.startActivityForResult(
                        intent,
                        REQUEST_CODE_OVERLAY_PERMISSION
                );
            } else {
                keyWatcher = new KeyWatcher(
                        applicationContext,
                        this::dispatchKeyEvent,
                        this::findFocus
                );
                addOverlayWindowView(keyWatcher);
            }
        }
    }

    private void detachKeyWatcher() {
        removeOverlayWindowView(keyWatcher);
        this.keyWatcher = null;
    }

    private void removeOverlayWindowView(
            View view
    ) {
        WindowManager windowManager = ((WindowManager) applicationContext.getSystemService(Context.WINDOW_SERVICE));
        if (windowManager != null && view != null) {
            try {
                windowManager.removeView(view);
            } catch (Exception ignore) {

            }
        }
    }

    @SuppressWarnings({"deprecation", "RedundantSuppression"})
    private void addOverlayWindowView(
            View view
    ) {
        int windowType = Build.VERSION.SDK_INT >= Build.VERSION_CODES.O ?
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                : WindowManager.LayoutParams.TYPE_SYSTEM_ALERT;

        WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                0,
                0,
                windowType,
                WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE,
                PixelFormat.TRANSLUCENT
        );

        WindowManager windowManager = ((WindowManager) applicationContext.getSystemService(Context.WINDOW_SERVICE));
        if (windowManager != null) {
            windowManager.addView(view, params);
        }
    }

    public View findFocus() {
        if (activity != null) {
            Window window = activity.getWindow();
            if (window != null) {
                try {
                    return window.getDecorView().getRootView();
                } catch (Exception e) {
                    e.printStackTrace();
                    return null;
                }
            }
        }
        return null;
    }

    private void dispatchKeyEvent(
            KeyEvent event
    ) {
        if (activity != null) {
            activity.dispatchKeyEvent(event);
        }
        if (this.events != null) {
            this.events.success(event.toString());
        }
    }

    @Override
    public boolean onActivityResult(
            int requestCode,
            int resultCode,
            Intent data
    ) {
        if (requestCode == REQUEST_CODE_OVERLAY_PERMISSION && activity != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && Settings.canDrawOverlays(activity.getApplicationContext())) {
                userDeniedDrawOverlaysPermission = false;
                attachKeyWatcherIfNeeded();
            } else {
                userDeniedDrawOverlaysPermission = true;
            }
            return true;
        }
        return false;
    }

    private static class KeyWatcher extends View {
        private final KeyEventCallback callback;
        private final FindFocusCallback findFocusCallback;

        public KeyWatcher(
                Context context,
                KeyEventCallback callback,
                FindFocusCallback findFocusCallback
        ) {
            super(context, null, 0);
            this.callback = callback;
            this.findFocusCallback = findFocusCallback;
        }

        @Override
        public boolean dispatchKeyEvent(
                KeyEvent event
        ) {
            if (callback != null) {
                callback.onKey(event);
            }
            return false;
        }

        @Override
        public View findFocus() {
            return findFocusCallback != null ? findFocusCallback.findFocus() : super.findFocus();
        }
    }

    interface KeyEventCallback {
        void onKey(KeyEvent event);
    }

    interface FindFocusCallback {
        View findFocus();
    }
}
