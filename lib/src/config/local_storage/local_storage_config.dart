library brick.configs.local_storage;

import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_enums.dart';

class LocalStorageConfig {
  LocalStorageConfig._();

  static final LocalStorageConfig _instance = LocalStorageConfig._();

  factory LocalStorageConfig() {
    return _instance;
  }

  late SharedPreferences prefs;
  late String envPrefix;

  String _getKey(LocalStorageKey localStorageKey) =>
      "${envPrefix}_${localStorageKey.name}";

  Future init({required String env}) async {
    prefs = await SharedPreferences.getInstance();
    envPrefix = "${env}_";
  }

  Set<String> getKeys() {
    return prefs.getKeys();
  }

  Object? getValue(LocalStorageKey localStorageKey) {
    String key = _getKey(localStorageKey);
    return prefs.get(key);
  }

  bool? getValueBool(LocalStorageKey localStorageKey) {
    String key = _getKey(localStorageKey);
    return prefs.getBool(key);
  }

  double? getValueDouble(LocalStorageKey localStorageKey) {
    String key = _getKey(localStorageKey);
    return prefs.getDouble(key);
  }

  int? getValueInt(LocalStorageKey localStorageKey) {
    String key = _getKey(localStorageKey);
    return prefs.getInt(key);
  }

  String? getValueString(LocalStorageKey localStorageKey) {
    String key = _getKey(localStorageKey);
    return prefs.getString(key);
  }

  List<String>? getValueStringList(LocalStorageKey localStorageKey) {
    String key = _getKey(localStorageKey);
    return prefs.getStringList(key);
  }

  setValueBool({
    required LocalStorageKey localStorageKey,
    required bool val,
  }) {
    String key = _getKey(localStorageKey);
    prefs.setBool(key, val);
  }

  setValueDouble({
    required LocalStorageKey localStorageKey,
    required double val,
  }) {
    String key = _getKey(localStorageKey);
    prefs.setDouble(key, val);
  }

  setValueInt({
    required LocalStorageKey localStorageKey,
    required int val,
  }) {
    String key = _getKey(localStorageKey);
    prefs.setInt(key, val);
  }

  setValueString({
    required LocalStorageKey localStorageKey,
    required String val,
  }) {
    String key = _getKey(localStorageKey);
    prefs.setString(key, val);
  }

  setValueStringList({
    required LocalStorageKey localStorageKey,
    required List<String> val,
  }) {
    String key = _getKey(localStorageKey);
    prefs.setStringList(key, val);
  }
}
