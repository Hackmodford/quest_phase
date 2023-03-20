import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/routes/app_router.dart';
import 'package:quest_phase/services/sound_effect_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black38, // Color for Android
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness:
          Brightness.dark, // Dark == white status bar -- for IOS.
    ),
  );
  final sharedPreferences = await SharedPreferences.getInstance();
  final soundEffectService = await SoundEffectService.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        soundEffectServiceProvider.overrideWithValue(soundEffectService),
      ],
      child: const QuestPhase(),
    ),
  );
}

class QuestPhase extends ConsumerWidget {
  const QuestPhase({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Quest Phase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: FontFamily.vafthrudnir,
        brightness: Brightness.dark,
      ),
      routerConfig: router,
    );
  }
}

extension RefDebounceExtension on Ref {
  /// Delays an execution by a bit such that if a dependency changes multiple
  /// time rapidly, the rest of the code is only run once.
  Future<void> debounce(Duration duration) {
    final completer = Completer<void>();
    final timer = Timer(duration, () {
      if (!completer.isCompleted) completer.complete();
    });
    onDispose(() {
      timer.cancel();
      if (!completer.isCompleted) {
        completer.completeError(StateError('Cancelled'));
      }
    });
    return completer.future;
  }
}
