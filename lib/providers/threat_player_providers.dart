import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:math';

final p1ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);
final p2ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);
final p3ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);
final p4ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);

class PlayerThreat extends Notifier<int> {
  final int minValue = 0;

  @override
  int build() {
    return 0;
  }

  void increase() {
    state = state + 1;
  }

  void decrease() {
    state = max(state - 1, minValue);
  }

  void reset() {
    state = 0;
  }

  void setValue(int value) {
    state = max(minValue, value);
  }
}
