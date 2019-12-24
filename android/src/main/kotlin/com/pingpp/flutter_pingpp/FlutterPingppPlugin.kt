package com.pingpp.flutter_pingpp

import com.pingplusplus.android.Pingpp
import android.app.Activity
import android.content.Intent

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterPingppPlugin: MethodCallHandler, PluginRegistry.ActivityResultListener {
  private val _registrar: Registrar
  private val METHOD_CHANNEL = "flutter_pingpp"
  private val channel: MethodChannel

  constructor(registrar: Registrar) {
    this._registrar = registrar
    this._registrar.addActivityResultListener(this)

    channel = MethodChannel(registrar.messenger(), METHOD_CHANNEL)
    channel.setMethodCallHandler(this)
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
    print(">>>>>>>>>>>><<<<<<<<<<")
    print(data)
    Pingpp.createPayment(currentActivity, data)
  }

  override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
    if (requestCode != Pingpp.REQUEST_CODE_PAYMENT) {
      channel.invokeMethod("payFailed", null)
      return false
    } else {
      var result = data?.getExtras()?.getString("pay_result")
      if(result == "success") {
        channel.invokeMethod("paySuccess", null)
        return true
      } else {
        channel.invokeMethod("payFailed", null)
        return false
      }
    }
  }
}
