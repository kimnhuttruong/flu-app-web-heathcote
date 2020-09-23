//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:ai_barcode/ai_barcode_web_plugin.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:shared_preferences_web/shared_preferences_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ignore: public_member_api_docs
void registerPlugins(PluginRegistry registry) {
  AiBarcodeWebPlugin.registerWith(registry.registrarFor(AiBarcodeWebPlugin));
  FluttertoastWebPlugin.registerWith(registry.registrarFor(FluttertoastWebPlugin));
  SharedPreferencesPlugin.registerWith(registry.registrarFor(SharedPreferencesPlugin));
  registry.registerMessageHandler();
}
