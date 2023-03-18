import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'willpower_total_provider.g.dart';

@riverpod
int willpowerTotal(WillpowerTotalRef ref) {
  final p1Will = ref.watch(
    savedStateNotifierProvider.select((value) => value.playerState1.willpower),
  );
  final p2Will = ref.watch(
    savedStateNotifierProvider.select((value) => value.playerState2.willpower),
  );
  final p3Will = ref.watch(
    savedStateNotifierProvider.select((value) => value.playerState3.willpower),
  );
  final p4Will = ref.watch(
    savedStateNotifierProvider.select((value) => value.playerState4.willpower),
  );
  return p1Will + p2Will + p3Will + p4Will;
}
