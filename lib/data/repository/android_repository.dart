import 'package:flutter/services.dart';

class AndroidRepository {
  static const channel = MethodChannel('net.yuzumone/atalantify');

  Future<String> getAction() async {
    return await channel.invokeMethod<String>('getAction');
  }
}