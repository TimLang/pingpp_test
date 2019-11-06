import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPingpp {
  static const MethodChannel _channel =
      const MethodChannel('flutter_pingpp');

  static Future<String> createPayment(String data) async {
    final String version = await _channel.invokeMethod('createPayment', { "data": data });
    return version;
  }
}
