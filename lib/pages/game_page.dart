import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/routes/app_router.dart';
import 'package:quest_phase/services/wakelock_service.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/game_grid.dart';
import 'package:visibility_detector/visibility_detector.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wakelock = ref.watch(wakelockServiceProvider);
    final shouldKeepScreenOn = ref.watch(shouldKeepScreenOnProvider);
    return VisibilityDetector(
      key: const Key('homepage-visibility-key'),
      onVisibilityChanged: (visibilityInfo) {
        final isEnabled =
            visibilityInfo.visibleFraction == 1 && shouldKeepScreenOn;
        wakelock.toggle(enable: isEnabled);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const AppRichText('Quest Phase', size: 24),
          leading: IconButton(
            onPressed: () => ref.read(routerProvider).goToSettings(),
            icon: const Icon(Icons.settings),
          ),
          actions: [
            IconButton(
              onPressed: () => _showNewGameDialog(context, ref),
              icon: const Icon(Icons.replay),
            ),
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: GameGrid(),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Future<void> _showNewGameDialog(BuildContext context, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const AppRichText('Are you sure', size: 24),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Clear the board state and start over.',
                  style: TextStyle(fontFamily: FontFamily.timesNewRoman),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.orangeAccent),
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const AppRichText('Cancel', size: 20),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.orangeAccent),
              onPressed: () {
                ref.read(savedStateNotifierProvider.notifier).reset();
                ref.read(routerProvider).goToNewGame();
              },
              child: const AppRichText('Yes', size: 20),
            ),
          ],
        );
      },
    );
  }
}
