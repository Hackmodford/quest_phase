import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final threatTotalProvider = StateNotifierProvider<ThreatTotalNotifier, int>(
    (ref) => ThreatTotalNotifier());

class ThreatTotalNotifier extends StateNotifier<int> {
  ThreatTotalNotifier() : super(0);

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
