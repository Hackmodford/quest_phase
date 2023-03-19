import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) =>
    throw UnimplementedError();

const String shouldResetStagingThreatKey = 'shouldResetStagingThreat';

@riverpod
class ShouldResetStagingThreat extends _$ShouldResetStagingThreat {
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final value = prefs.getBool(shouldResetStagingThreatKey);
    return value ?? true;
  }

  Future<void> update({required bool value}) async {
    state = value;
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(shouldResetStagingThreatKey, value);
  }
}

const String shouldKeepScreenOnKey = 'shouldKeepScreenOn';

@riverpod
class ShouldKeepScreenOn extends _$ShouldKeepScreenOn {
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final value = prefs.getBool(shouldKeepScreenOnKey);
    return value ?? false;
  }

  Future<void> update({required bool value}) async {
    state = value;
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(shouldKeepScreenOnKey, value);
  }
}
