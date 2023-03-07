import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/utils/shared_preferences_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final settingShouldResetStagingThreatProvider = createPrefProvider(
  prefs: (ref) => ref.read(sharedPreferencesProvider),
  prefKey: 'shouldResetStagingThreat',
  defaultValue: true,
);

final settingShouldKeepScreenOnProvider = createPrefProvider(
  prefs: (ref) => ref.read(sharedPreferencesProvider),
  prefKey: 'shouldKeepScreenOn',
  defaultValue: false,
);
