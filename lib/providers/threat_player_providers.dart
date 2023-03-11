import 'package:hooks_riverpod/hooks_riverpod.dart';

final p1ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);
final p2ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);
final p3ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);
final p4ThreatProvider = NotifierProvider<PlayerThreat, int>(PlayerThreat.new);

class PlayerThreat extends Notifier<int> {
  final int minValue = 0;
  final int maxValue = 9999;

  @override
  int build() {
    return 0;
  }

  void increase() {
    state = (state + 1).clamp(minValue, maxValue);
  }

  void decrease() {
    state = (state - 1).clamp(minValue, maxValue);
  }

  void reset() {
    state = 0;
  }

  void setValue(int value) {
    state = value.clamp(minValue, maxValue);
  }
}
