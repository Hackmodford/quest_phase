// source: https://github.com/gamako/shared_preferences_riverpod/blob/master/lib/shared_preferences_riverpod.dart
library shared_preferences_flutter_riverpod;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefNotifier<T> extends StateNotifier<T> {
  PrefNotifier(this.prefs, this.prefKey, this.defaultValue)
      : super(prefs.get(prefKey) as T? ?? defaultValue);

  SharedPreferences prefs;
  String prefKey;
  T defaultValue;

  /// Updates the value asynchronously.
  Future<void> update(T value) async {
    if (value is String) {
      await prefs.setString(prefKey, value);
    } else if (value is bool) {
      await prefs.setBool(prefKey, value);
    } else if (value is int) {
      await prefs.setInt(prefKey, value);
    } else if (value is double) {
      await prefs.setDouble(prefKey, value);
    } else if (value is List<String>) {
      await prefs.setStringList(prefKey, value);
    }
    super.state = value;
  }

  /// Do not use the setter for state.
  /// Instead, use `await update(value).`
  @override
  set state(T value) {
    assert(false,
    "Don't use the setter for state. Instead use `await update(value)`.");
    Future(() async {
      await update(value);
    });
  }
}

StateNotifierProvider<PrefNotifier<T>, T> createPrefProvider<T>({
  required SharedPreferences Function(Ref) prefs,
  required String prefKey,
  required T defaultValue,
}) {
  return StateNotifierProvider<PrefNotifier<T>, T>(
          (ref) => PrefNotifier<T>(prefs(ref), prefKey, defaultValue));
}
