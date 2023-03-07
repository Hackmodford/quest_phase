import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/router_provider.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/providers/wakelock_provider.dart';
import 'package:quest_phase/widgets/game_grid.dart';
import 'package:visibility_detector/visibility_detector.dart';

class GamePage extends ConsumerWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wakelock = ref.watch(wakelockProvider);
    final shouldKeepScreenOn = ref.watch(settingShouldKeepScreenOnProvider);
    return VisibilityDetector(
      key: const Key('homepage-visibility-key'),
      onVisibilityChanged: (visibilityInfo) {
        final isEnabled = visibilityInfo.visibleFraction == 1 && shouldKeepScreenOn;
        wakelock.toggle(enable: isEnabled);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quest Phase'),
          leading: IconButton(
            onPressed: () => ref.read(routerProvider).go('/game/settings'),
            icon: const Icon(Icons.settings),
          ),
          actions: [
            TextButton(
              onPressed: () => _showNewGameDialog(context, ref),
              child: const Text("New Game"),
            ),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(4.0),
          child: SafeArea(
            child: GameGrid(),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Future<void> _showNewGameDialog(BuildContext context, WidgetRef ref) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Clear the board state and start over.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => ref.read(routerProvider).go('/'),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
