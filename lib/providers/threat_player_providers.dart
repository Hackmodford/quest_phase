import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/utils/counter_notifier.dart';

final p1ThreatProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
final p2ThreatProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
final p3ThreatProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
final p4ThreatProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
