import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/player_count_provider.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/router_provider.dart';
import 'package:quest_phase/providers/staging_threat_provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:quest_phase/routes/go_router_extensions.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/quote_block.dart';

class NewGamePage extends ConsumerWidget {
  const NewGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 80,
            ),
            Center(child: buildRichText('Welcome', 50)),
            const Spacer(),
            const Center(
                child: Text(
              'How many are in your party?',
              style: TextStyle(
                fontFamily: FontFamily.timesNewRoman,
                fontSize: 25,
              ),
            )),
            const SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () => _startNewGame(ref, 1),
                    child: buildRichText('1', 24)),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () => _startNewGame(ref, 2),
                    child: buildRichText('2', 24)),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () => _startNewGame(ref, 3),
                    child: buildRichText('3', 24)),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent),
                    onPressed: () => _startNewGame(ref, 4),
                    child: buildRichText('4', 24)),
              ],
            ),
            const Spacer(),
            const QuoteBlock(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  void _startNewGame(WidgetRef ref, int playerCount) {
    if (playerCount == 1) {
      ref.read(playerCountProvider.notifier).setOnePlayer();
    } else if (playerCount == 2) {
      ref.read(playerCountProvider.notifier).setTwoPlayer();
    } else if (playerCount == 3) {
      ref.read(playerCountProvider.notifier).setThreePlayer();
    } else if (playerCount == 4) {
      ref.read(playerCountProvider.notifier).setFourPlayer();
    }
    ref.read(p1ThreatProvider.notifier).reset();
    ref.read(p2ThreatProvider.notifier).reset();
    ref.read(p3ThreatProvider.notifier).reset();
    ref.read(p4ThreatProvider.notifier).reset();
    ref.read(p1WillpowerProvider.notifier).reset();
    ref.read(p2WillpowerProvider.notifier).reset();
    ref.read(p3WillpowerProvider.notifier).reset();
    ref.read(p4WillpowerProvider.notifier).reset();
    ref.read(roundProvider.notifier).reset();
    ref.read(stagingThreatProvider.notifier).reset();
    ref.read(routerProvider).goToGame();
  }
}
