import 'package:shared_preferences/shared_preferences.dart';

// creating a wrapper around shared prefrences class to use throuhout the app

abstract class UserPreferences {
  Future<void> init();
  bool containsKey(String key);
  String getString(String key);
  bool getBool(String key);
  Future<void> setString(String key, String value);
  Future<void> setBool(String key, bool value);
}

class UserPreferencesImpl extends UserPreferences {
  SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool containsKey(String key) {
    try {
      return _sharedPreferences.containsKey(key);
    } catch (e) {
      throw UserPreferencesError(message: e.toString());
    }
  }

  String getString(String key) {
    try {
      return _sharedPreferences.getString(key);
    } catch (e) {
      throw UserPreferencesError(message: e.toString());
    }
  }

  bool getBool(String key) {
    try {
      return _sharedPreferences.getBool(key);
    } catch (e) {
      throw UserPreferencesError(message: e.toString());
    }
  }

  Future<void> setString(String key, String value) async {
    try {
      await _sharedPreferences.setString(key, value);
    } catch (e) {
      throw UserPreferencesError(message: e.toString());
    }
  }

  Future<void> setBool(String key, bool value) async {
    try {
      await _sharedPreferences.setBool(key, value);
    } catch (e) {
      throw UserPreferencesError(message: e.toString());
    }
  }
}

class UserPreferencesError implements Exception {
  final String message;

  UserPreferencesError({this.message});
}
