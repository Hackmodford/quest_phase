import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef BuildCounterCallback = int Function(Ref);

class CounterNotifier extends Notifier<int> {
  CounterNotifier({this.onBuild});

  final BuildCounterCallback? onBuild;
  final int minValue = 0;
  final int maxValue = 9999;

  @override
  int build() {
    if (onBuild == null) {
      return 0;
    }
    return onBuild!(ref);
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
