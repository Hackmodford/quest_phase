import 'package:wakelock/wakelock.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wakelock_service.g.dart';

@riverpod
WakelockService wakelockService(WakelockServiceRef ref) => WakelockService();

class WakelockService {
  void enable(){
    Wakelock.enable();
  }
  void disable(){
    Wakelock.disable();
  }
  void toggle({required bool enable}) {
    Wakelock.toggle(enable: enable);
  }
}