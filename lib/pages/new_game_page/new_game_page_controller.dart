import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/player_count_provider.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/staging_threat_provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:quest_phase/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_game_page_controller.g.dart';

@riverpod
NewGamePageController newGamePageController(NewGamePageControllerRef ref) => NewGamePageController(ref);

class NewGamePageController {
  final Ref _ref;

  NewGamePageController(this._ref);

  void onStartNewGame(int playerCount) {
    if (playerCount == 1) {
      _ref.read(playerCountProvider.notifier).setOnePlayer();
    } else if (playerCount == 2) {
      _ref.read(playerCountProvider.notifier).setTwoPlayer();
    } else if (playerCount == 3) {
      _ref.read(playerCountProvider.notifier).setThreePlayer();
    } else if (playerCount == 4) {
      _ref.read(playerCountProvider.notifier).setFourPlayer();
    }
    _ref.read(p1ThreatProvider.notifier).reset();
    _ref.read(p2ThreatProvider.notifier).reset();
    _ref.read(p3ThreatProvider.notifier).reset();
    _ref.read(p4ThreatProvider.notifier).reset();
    _ref.read(p1WillpowerProvider.notifier).reset();
    _ref.read(p2WillpowerProvider.notifier).reset();
    _ref.read(p3WillpowerProvider.notifier).reset();
    _ref.read(p4WillpowerProvider.notifier).reset();
    _ref.read(roundProvider.notifier).setValue(1);
    _ref.read(stagingThreatProvider.notifier).reset();
    _ref.read(routerProvider).goToGame();
  }
}