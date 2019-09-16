import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

import 'model/token.dart';


dynamic getKey() async {
  var keyJson = await rootBundle.loadString('assets/.apikeys');
  return json.decode(keyJson);
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

