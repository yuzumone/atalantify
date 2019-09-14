import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

dynamic getKey() async {
  var keyJson = await rootBundle.loadString('assets/.apikeys');
  return json.decode(keyJson);
}
