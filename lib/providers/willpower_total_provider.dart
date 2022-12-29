import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:quest_phase/providers/willpower_player_providers.dart';

final willpowerTotalProvider = Provider<int>(
    (ref) {
      final p1Will = ref.watch(p1WillpowerProvider);
      final p2Will = ref.watch(p2WillpowerProvider);
      final p3Will = ref.watch(p3WillpowerProvider);
      final p4Will = ref.watch(p4WillpowerProvider);
      return p1Will + p2Will + p3Will + p4Will;
    });
