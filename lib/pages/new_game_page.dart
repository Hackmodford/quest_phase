import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/router_provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/threat_total_provider.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:quest_phase/routes/go_router_extensions.dart';
import 'package:quest_phase/utils/font_utils.dart';

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
            const SizedBox(height: 80,),
            Center(child: buildRichText('Welcome', 50)),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
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
                },
                child: buildRichText('New Game', 24))
          ],
        ),
      ),
    );
  }
}
