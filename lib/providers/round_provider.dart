import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final roundProvider =
    StateNotifierProvider<RoundNotifier, int>((ref) => RoundNotifier());

class RoundNotifier extends StateNotifier<int> {
  RoundNotifier() : super(0);

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
