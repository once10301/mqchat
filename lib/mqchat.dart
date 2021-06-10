
import 'dart:async';

import 'package:flutter/services.dart';

class Mqchat {
  static const MethodChannel _channel = const MethodChannel('mqchat');

  static Future<void> init(String appKey) async {
    await _channel.invokeMethod('init', appKey);
  }

  static Future<void> chat(Map map) async {
    await _channel.invokeMethod('chat', map);
  }
}
