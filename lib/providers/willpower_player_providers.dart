import 'package:hooks_riverpod/hooks_riverpod.dart';

final p1WillpowerProvider =
    NotifierProvider<PlayerWillpower, int>(PlayerWillpower.new);

final p2WillpowerProvider =
    NotifierProvider<PlayerWillpower, int>(PlayerWillpower.new);

final p3WillpowerProvider =
    NotifierProvider<PlayerWillpower, int>(PlayerWillpower.new);

final p4WillpowerProvider =
    NotifierProvider<PlayerWillpower, int>(PlayerWillpower.new);

class PlayerWillpower extends Notifier<int> {
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
