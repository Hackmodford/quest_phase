import 'dart:async';

import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  final soLoud = SoLoud.instance;
  late final AudioSource increaseSound;
  late final AudioSource decreaseSound;

  Future<void> init() async {
    await soLoud.init();
    increaseSound =
        await soLoud.loadAsset(Assets.sounds.mixkitCoolInterfaceClickTone2568);
    decreaseSound =
        await soLoud.loadAsset(Assets.sounds.mixkitCoolInterfaceClickTone25682);
  }

  Future<void> playIncrease() async {
    await soLoud.play(increaseSound);
  }

  Future<void> playDecrease() async {
    await soLoud.play(decreaseSound);
  }
}
