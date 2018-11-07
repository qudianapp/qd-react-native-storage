package com.qudian.react_storage;

import android.content.Context;
import android.content.SharedPreferences;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

/**
 * @author fubaolin 
 */
public class RNStorageModule extends ReactContextBaseJavaModule {

    private static SharedPreferences sPrefs;
    private static final String PRE_NAME = "cross_platform_pref";

    public RNStorageModule(ReactApplicationContext reactContext) {
        super(reactContext);
        sPrefs = reactContext.getSharedPreferences(PRE_NAME, Context.MODE_PRIVATE);
    }

    @Override
    public String getName() {
        return "RNStorage";
    }

    @ReactMethod
    public static void setStringForKey(String value, String key) {
        if (sPrefs == null) {
            return;
        }
        sPrefs.edit().putString(key, value).apply();
    }

    /**
     * @param value long is not supported, use int instead. com.facebook.react.bridge.Arguments
     * @param key
     */
    @ReactMethod
    public static void setLongForKey(int value, String key) {
        if (sPrefs == null) {
            return;
        }
        sPrefs.edit().putInt(key, value).apply();
    }

    @ReactMethod
    public static void setDoubleForKey(Float value, String key) {
        if (sPrefs == null) {
            return;
        }
        sPrefs.edit().putFloat(key, value).apply();
    }

    @ReactMethod
    public static void setBoolForKey(Boolean value, String key) {
        if (sPrefs == null) {
            return;
        }
        sPrefs.edit().putBoolean(key, value).apply();
    }

    @ReactMethod
    public void stringForKey(String key, Promise promise) {
        if (sPrefs == null) {
            return;
        }
        String value = sPrefs.getString(key, "");
        promise.resolve(value);
    }

    @ReactMethod
    public void longForKey(String key, Promise promise) {
        if (sPrefs == null) {
            return;
        }
        int value = sPrefs.getInt(key, 0);
        promise.resolve(value);
    }

    @ReactMethod
    public void doubleForKey(String key, Promise promise) {
        if (sPrefs == null) {
            return;
        }
        float value = sPrefs.getFloat(key, 0f);
        promise.resolve(value);
    }

    @ReactMethod
    public void boolForKey(String key, Promise promise) {
        if (sPrefs == null) {
            return;
        }
        boolean value = sPrefs.getBoolean(key, false);
        promise.resolve(value);
    }

    @ReactMethod
    public static void removeItemForKey(String key) {
        if (sPrefs == null) {
            return;
        }
        sPrefs.edit().remove(key).apply();
    }

    public static String getString(String key) {
        if (sPrefs == null) {
            return "";
        }
        return sPrefs.getString(key, "");
    }

    public static Boolean getBoolean(String key) {
        if (sPrefs == null) {
            return false;
        }
        return sPrefs.getBoolean(key, false);
    }

    public static Long getLong(String key) {
        if (sPrefs == null) {
            return 0L;
        }
        return sPrefs.getLong(key, 0L);
    }

    public static Float getFloat(String key) {
        if (sPrefs == null) {
            return 0f;
        }
        return sPrefs.getFloat(key, 0f);
    }
}