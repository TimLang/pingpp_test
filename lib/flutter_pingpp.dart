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


  createPayment(String data, Function onSuccess, Function onError, {String urlSchema=null}) async {
    _onPaySuccess = onSuccess;
    _onPayError = onError;
    Map<String, String> params = { "data": data };
    if(urlSchema != null) {
      params['urlSchema'] = urlSchema;
    }
    await _methodChannel.invokeMethod('createPayment', params);
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
