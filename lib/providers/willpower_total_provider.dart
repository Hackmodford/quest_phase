import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:quest_phase/providers/willpower_player_providers.dart';

part 'willpower_total_provider.g.dart';

@riverpod
int willpowerTotal(WillpowerTotalRef ref) {
  final p1Will = ref.watch(p1WillpowerProvider);
  final p2Will = ref.watch(p2WillpowerProvider);
  final p3Will = ref.watch(p3WillpowerProvider);
  final p4Will = ref.watch(p4WillpowerProvider);
  return p1Will + p2Will + p3Will + p4Will;
}
