import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/router_provider.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/providers/wakelock_provider.dart';
import 'package:quest_phase/routes/go_router_extensions.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/game_grid.dart';
import 'package:visibility_detector/visibility_detector.dart';

class GamePage extends ConsumerWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wakelock = ref.watch(wakelockServiceProvider);
    final shouldKeepScreenOn = ref.watch(settingShouldKeepScreenOnProvider);
    return VisibilityDetector(
      key: const Key('homepage-visibility-key'),
      onVisibilityChanged: (visibilityInfo) {
        final isEnabled = visibilityInfo.visibleFraction == 1 && shouldKeepScreenOn;
        wakelock.toggle(enable: isEnabled);
      },
      child: Scaffold(
        appBar: AppBar(
          title: buildRichText("Quest Phase", 24),
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
            padding: EdgeInsets.all(8.0),
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
          title: buildRichText("Are you sure", 24),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Clear the board state and start over.', style: TextStyle(fontFamily: FontFamily.timesNewRoman),),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.orangeAccent),
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: buildRichText("Cancel", 20),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.orangeAccent),
              onPressed: () => ref.read(routerProvider).goToNewGame(),
              child: buildRichText("Yes", 20),
            ),
          ],
        );
      },
    );
  }
}
