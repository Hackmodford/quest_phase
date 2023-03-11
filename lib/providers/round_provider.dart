import 'dart:math';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'round_provider.g.dart';

@riverpod
class Round extends _$Round {
  @override
  int build() {
    return 0;
  }

  void increase() {
    state = state + 1;
  }

  void decrease() {
    state = max(state - 1, 0);
  }

  void reset() {
    state = 0;
  }

  void setValue(int value) {
    state = max(0, value);
  }
}
