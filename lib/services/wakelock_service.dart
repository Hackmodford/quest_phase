import 'package:wakelock/wakelock.dart';

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