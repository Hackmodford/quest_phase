import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'threat_total_provider.g.dart';

@riverpod
class StagingThreat extends _$StagingThreat {
  @override
  int build() {
    return 0;
  }

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
