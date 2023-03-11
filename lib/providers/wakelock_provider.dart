import 'package:quest_phase/services/wakelock_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wakelock_provider.g.dart';

@riverpod
WakelockService wakelockService(WakelockServiceRef ref) => WakelockService();
