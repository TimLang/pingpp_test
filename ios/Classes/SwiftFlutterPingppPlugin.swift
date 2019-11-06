import Flutter
import UIKit

public class SwiftFlutterPingppPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_pingpp", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterPingppPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "getPlatformVersion") {
    result("安卓 " + UIDevice.current.systemVersion)
    } else {
        result("dsdsdsdsd")
    }
  }
}
