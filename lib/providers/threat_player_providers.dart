import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final p1ThreatProvider = StateNotifierProvider<PlayerThreatNotifier, int>(
    (ref) => PlayerThreatNotifier());

final p2ThreatProvider = StateNotifierProvider<PlayerThreatNotifier, int>(
        (ref) => PlayerThreatNotifier());

final p3ThreatProvider = StateNotifierProvider<PlayerThreatNotifier, int>(
        (ref) => PlayerThreatNotifier());

final p4ThreatProvider = StateNotifierProvider<PlayerThreatNotifier, int>(
        (ref) => PlayerThreatNotifier());

class PlayerThreatNotifier extends StateNotifier<int> {
  PlayerThreatNotifier() : super(0);

  void increase() {
    state = state + 1;
  }

  void decrease() {
    state = max(state - 1, 0);
  }

  void reset() {
    state = 0;
  }
}
