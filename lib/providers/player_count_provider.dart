import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_count_provider.g.dart';

@Riverpod(keepAlive: true)
class PlayerCount extends _$PlayerCount {
  @override
  int build() {
    return 1;
  }

  void setOnePlayer(){
    state = 1;
  }

  void setTwoPlayer(){
    state = 2;
  }

  void setThreePlayer(){
    state = 3;
  }

  void setFourPlayer(){
    state = 4;
  }
}
