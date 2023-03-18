import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/pages/new_game_page/new_game_page_controller.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/quote_block.dart';

class NewGamePage extends ConsumerWidget {
  const NewGamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            80.heightBox,
            Center(child: buildRichText('Welcome', 50)),
            const Spacer(),
            const Center(
              child: Text(
                'How many are in your party?',
                style: TextStyle(
                  fontFamily: FontFamily.timesNewRoman,
                  fontSize: 25,
                ),
              ),
            ),
            32.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(1),
                  child: buildRichText('1', 24),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(2),
                  child: buildRichText('2', 24),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(3),
                  child: buildRichText('3', 24),
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(4),
                  child: buildRichText('4', 24),
                ),
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
}
