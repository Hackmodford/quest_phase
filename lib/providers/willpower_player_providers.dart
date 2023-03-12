import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/utils/counter_notifier.dart';

final p1WillpowerProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

final p2WillpowerProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

final p3WillpowerProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);

final p4WillpowerProvider =
    NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
