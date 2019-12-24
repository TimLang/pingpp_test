package com.pingpp.flutter_pingpp

import com.pingplusplus.android.Pingpp;
import android.app.Activity;
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterPingppPlugin: MethodCallHandler {
  private val _registrar: Registrar

  constructor(registrar: Registrar) {
    this._registrar = registrar
  }

  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_pingpp")
      channel.setMethodCallHandler(FlutterPingppPlugin(registrar))
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "createPayment") {
      createPayment(_registrar.activity(), call, result)
//      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  fun createPayment(currentActivity: Activity, call: MethodCall, result: Result) {
    var data = call.argument<String>("data")
    Pingpp.createPayment(currentActivity, data)
  }
}
