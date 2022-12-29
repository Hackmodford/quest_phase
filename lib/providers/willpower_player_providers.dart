import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final p1WillpowerProvider = StateNotifierProvider<PlayerWillpowerNotifier, int>(
    (ref) => PlayerWillpowerNotifier());

final p2WillpowerProvider = StateNotifierProvider<PlayerWillpowerNotifier, int>(
        (ref) => PlayerWillpowerNotifier());

final p3WillpowerProvider = StateNotifierProvider<PlayerWillpowerNotifier, int>(
        (ref) => PlayerWillpowerNotifier());

final p4WillpowerProvider = StateNotifierProvider<PlayerWillpowerNotifier, int>(
        (ref) => PlayerWillpowerNotifier());

class PlayerWillpowerNotifier extends StateNotifier<int> {
  PlayerWillpowerNotifier() : super(0);

  void add(int value) {
    state = state + value;
  }

  void remove(int value) {
    state = max(state - value, 0);
  }

  void reset() {
    state = 0;
  }
}
