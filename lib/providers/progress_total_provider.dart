import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/willpower_total_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_total_provider.g.dart';

@riverpod
int progressTotal(ProgressTotalRef ref) {
  final totalWillpower = ref.watch(willpowerTotalProvider);
  final stagingThreat = ref.watch(
    savedStateNotifierProvider.select((value) => value.stagingThreat),
  );

  return totalWillpower - stagingThreat;
}
