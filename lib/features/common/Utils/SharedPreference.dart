import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getString({required String value}) {
    return _prefsInstance!.getString(value) ?? "";
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }
}
