import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provider that exposes the SharedPreferences instance throughout the app
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'SharedPreferences instance must be overridden before use',
  );
});

/// Helper class to manage shared preferences operations
class SharedPreferencesHelper {
  final SharedPreferences _prefs;

  SharedPreferencesHelper(this._prefs);

  // String operations
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  String? getString(String key) {
    return _prefs.getString(key);
  }

  // Int operations
  Future<bool> setInt(String key, int value) async {
    return await _prefs.setInt(key, value);
  }

  int? getInt(String key) {
    return _prefs.getInt(key);
  }

  // Bool operations
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs.getBool(key);
  }

  // Remove and clear operations
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }

  // Check if key exists
  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}

/// Provider for the SharedPreferencesHelper
final sharedPreferencesHelperProvider =
    Provider<SharedPreferencesHelper>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesHelper(prefs);
});
