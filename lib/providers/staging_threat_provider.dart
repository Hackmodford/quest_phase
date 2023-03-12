import 'package:quest_phase/providers/utils/counter_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final stagingThreatProvider = NotifierProvider<CounterNotifier, int>(CounterNotifier.new);
