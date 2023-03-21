import 'dart:async';

import 'package:flutter/services.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:soundpool/soundpool.dart';

part 'sound_effect_service.g.dart';

@riverpod
SoundEffectService soundEffectService(SoundEffectServiceRef ref) =>
    throw UnimplementedError();

class SoundEffectService {

  SoundEffectService._();

  static Completer<SoundEffectService>? _completer;

  static Future<SoundEffectService> getInstance() async {
    if (_completer == null) {
      final completer = Completer<SoundEffectService>();
      try {
        final service = SoundEffectService._();
        await service.init();
        completer.complete(service);
      } on Exception catch (e) {
        // If there's an error, explicitly return the future with an error.
        // then set the completer to null so we can retry.
        completer.completeError(e);
        final soundEffectsServiceFuture = completer.future;
        _completer = null;
        return soundEffectsServiceFuture;
      }
      _completer = completer;
    }
    return _completer!.future;
  }

  final pool = Soundpool.fromOptions(
    options: const SoundpoolOptions(
      streamType: StreamType.notification,
      maxStreams: 4,
    ),
  );

  late final int soundId;

  Future<void> init() async {
    final rawSound =
        await rootBundle.load(Assets.sounds.mixkitCoolInterfaceClickTone2568);
    soundId = await pool.load(rawSound);
  }

  Future<void> play() async {
    await pool.play(soundId);
  }
}