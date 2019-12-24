
package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.pingpp.flutter_pingpp.FlutterPingppPlugin;

public final class GeneratedPluginRegistrant {
    public static void registerWith(PluginRegistry registry) {
        if (alreadyRegisteredWith(registry)) {
            return;
        }
        FlutterAlipayPlugin.registerWith(registry.registrarFor("com.pingpp.flutter_pingpp.FlutterPingppPlugin"));
    }

    private static boolean alreadyRegisteredWith(PluginRegistry registry) {
        final String key = GeneratedPluginRegistrant.class.getCanonicalName();
        if (registry.hasPlugin(key)) {
            return true;
        }
        registry.registrarFor(key);
        return false;
    }
}