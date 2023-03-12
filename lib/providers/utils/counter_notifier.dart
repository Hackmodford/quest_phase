import 'package:riverpod_annotation/riverpod_annotation.dart';

class CounterNotifier extends Notifier<int> {
  final int minValue = 0;
  final int maxValue = 9999;

  @override
  int build() {
    return 0;
  }

  void add(int value) {
    state = (state + value).clamp(minValue, maxValue);
  }

  void remove(int value) {
    state = (state - value).clamp(minValue, maxValue);
  }

  void reset() {
    state = 0;
  }

  void setValue(int value) {
    state = value.clamp(minValue, maxValue);
  }
}