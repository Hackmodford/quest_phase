import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'wakelock_service.g.dart';

@riverpod
WakelockService wakelockService(WakelockServiceRef ref) => WakelockService();

class WakelockService {
  void enable(){
    WakelockPlus.enable();
  }
  void disable(){
    WakelockPlus.disable();
  }
  void toggle({required bool enable}) {
    WakelockPlus.toggle(enable: enable);
  }
}
