import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

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

  @override
  int build() {
    return 0;
  }

  void add(int value) {
    state += value;
  }

  void remove(int value) {
    state = max(state - value, minValue);
  }

  void reset() {
    state = 0;
  }

  void setValue(int value) {
    state = max(minValue, value);
  }
}
