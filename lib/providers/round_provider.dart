import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'round_provider.g.dart';

@riverpod
class Round extends _$Round {
  final int minValue = 0;
  final int maxValue = 9999;
  @override
  int build() {
    return 1;
  }

  void increase() {
    state = (state + 1).clamp(minValue, maxValue);
  }

  void decrease() {
    state = (state - 1).clamp(minValue, maxValue);
  }

  void reset() {
    state = 1;
  }

  void setValue(int value) {
    state = value.clamp(minValue, maxValue);
  }
}
