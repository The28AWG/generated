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

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        this.eventChannel = new EventChannel(
                binding.getBinaryMessenger(),
                HARDWARE_BUTTONS_CHANNEL_NAME
        );
        this.eventChannel.setStreamHandler(this);
        System.out.println("HardwareButtonsPlugin.onAttachedToEngine");
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        detachKeyWatcher();
        this.eventChannel.setStreamHandler(null);
        this.eventChannel = null;
        System.out.println("HardwareButtonsPlugin.onDetachedFromEngine");
    }

    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        attachKeyWatcherIfNeeded();
        System.out.println("HardwareButtonsPlugin.onAttachedToActivity");
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        detachKeyWatcher();
        this.activity = null;
        userDeniedDrawOverlaysPermission = false;
        System.out.println("HardwareButtonsPlugin.onDetachedFromActivityForConfigChanges");
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        this.activity = binding.getActivity();
        System.out.println("HardwareButtonsPlugin.onReattachedToActivityForConfigChanges");
    }

    @Override
    public void onDetachedFromActivity() {
        detachKeyWatcher();
        this.activity = null;
        userDeniedDrawOverlaysPermission = false;
        System.out.println("HardwareButtonsPlugin.onDetachedFromActivity");
    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
        this.events = events;
        attachKeyWatcherIfNeeded();
        System.out.println("HardwareButtonsPlugin.onListen");
    }

    @Override
    public void onCancel(Object arguments) {
        detachKeyWatcher();
        this.events = null;
        System.out.println("HardwareButtonsPlugin.onCancel");
    }

    private void attachKeyWatcherIfNeeded() {
        System.out.println("HardwareButtonsPlugin.attachKeyWatcherIfNeeded");
        if (keyWatcher == null && !userDeniedDrawOverlaysPermission && activity != null) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(activity.getApplicationContext())) {
                Intent intent = new Intent(
                        Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                        Uri.parse("package:" + activity.getApplicationContext().getPackageName())
                );
                activity.startActivityForResult(
                        intent,
                        REQUEST_CODE_OVERLAY_PERMISSION
                );
            } else {
                keyWatcher = new KeyWatcher(
                        activity.getApplicationContext(),
                        this::dispatchKeyEvent,
                        this::findFocus
                );
                addOverlayWindowView(activity.getApplicationContext(), keyWatcher);
            }
        }
    }

    private void detachKeyWatcher() {
        if (activity != null) {
            removeOverlayWindowView(activity.getApplicationContext(), keyWatcher);
            this.keyWatcher = null;
        }
    }

    private void removeOverlayWindowView(
            Context context,
            View view
    ) {
        ((WindowManager) context.getSystemService(Context.WINDOW_SERVICE)).removeView(view);
    }

    private void addOverlayWindowView(
            Context context,
            View view
    ) {
        System.out.println("HardwareButtonsPlugin.addOverlayWindowView");
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

        ((WindowManager) context.getSystemService(Context.WINDOW_SERVICE)).addView(view, params);
    }

    public View findFocus() {
        System.out.println("HardwareButtonsPlugin.findFocus");
        if (activity != null) {
            Window window = activity.getWindow();
            if (window != null) {
                return window.getDecorView().getRootView();
            }
        }
        return null;
    }

    private void dispatchKeyEvent(
            KeyEvent event
    ) {
        System.out.println("HardwareButtonsPlugin.dispatchKeyEvent");
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
        System.out.println("HardwareButtonsPlugin.onActivityResult");
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
            System.out.println("KeyWatcher.dispatchKeyEvent");
            if (callback != null) {
                callback.onKey(event);
            }
            return false;
        }

        @Override
        public View findFocus() {
            System.out.println("KeyWatcher.findFocus");
            return findFocusCallback.findFocus();
        }
    }

    interface KeyEventCallback {
        void onKey(KeyEvent event);
    }

    interface FindFocusCallback {
        View findFocus();
    }
}
