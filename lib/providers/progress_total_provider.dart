import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/threat_total_provider.dart';
import 'package:quest_phase/providers/willpower_total_provider.dart';

final progressTotalProvider = Provider<int>((ref) {
  final totalWillpower = ref.watch(willpowerTotalProvider);
  final totalThreat = ref.watch(threatTotalProvider);

  return totalWillpower - totalThreat;
});
