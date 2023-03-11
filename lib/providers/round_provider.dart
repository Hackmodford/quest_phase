import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'round_provider.g.dart';

@riverpod
class Round extends _$Round {
  final int minValue = 0;
  @override
  int build() {
    return 1;
  }

  void increase() {
    state = state + 1;
  }

  void decrease() {
    state = max(state - 1, minValue);
  }

  void reset() {
    state = 1;
  }

  void setValue(int value) {
    state = max(minValue, value);
  }
}
