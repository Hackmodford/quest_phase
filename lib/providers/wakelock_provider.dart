import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/services/wakelock_service.dart';

final wakelockProvider = Provider<WakelockService>((ref) {
  return WakelockService();
});
