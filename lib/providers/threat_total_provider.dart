import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final stagingThreatProvider = StateNotifierProvider<StagingThreatNotifier, int>(
    (ref) => StagingThreatNotifier());

class StagingThreatNotifier extends StateNotifier<int> {
  StagingThreatNotifier() : super(0);

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
