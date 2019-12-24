import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPingpp {
  static const MethodChannel _methodChannel =
      const MethodChannel('flutter_pingpp');

  FlutterPingpp() {
     _methodChannel.setMethodCallHandler(_callHandler);
  }

  Function _onPaySuccess;
  Function _onPayError;


  createPayment(String data, Function onSuccess, Function onError) async {
    _onPaySuccess = onSuccess;
    _onPayError = onError;
    await _methodChannel.invokeMethod('createPayment', { "data": data });
  }

  Future<void> _callHandler(MethodCall call) async {
    switch (call.method) {
      case 'paySuccess':
        _onPaySuccess(call.arguments);
        break;
      case 'payFailed':
        _onPayError(call.arguments);
        break;
    }
  }
}
