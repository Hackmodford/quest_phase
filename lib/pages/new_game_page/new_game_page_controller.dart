import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_game_page_controller.g.dart';

@riverpod
NewGamePageController newGamePageController(NewGamePageControllerRef ref) =>
    NewGamePageController(ref);

class NewGamePageController {
  NewGamePageController(this._ref);

  final Ref _ref;

  void onStartNewGame(int playerCount) {
    _ref.read(savedStateNotifierProvider.notifier).reset();
    if (playerCount == 1) {
      _ref.read(savedStateNotifierProvider.notifier).setOnePlayer();
    } else if (playerCount == 2) {
      _ref.read(savedStateNotifierProvider.notifier).setTwoPlayer();
    } else if (playerCount == 3) {
      _ref.read(savedStateNotifierProvider.notifier).setThreePlayer();
    } else if (playerCount == 4) {
      _ref.read(savedStateNotifierProvider.notifier).setFourPlayer();
    }
    _ref.read(routerProvider).goToGame();
  }
}
