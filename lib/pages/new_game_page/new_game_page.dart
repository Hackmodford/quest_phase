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
            const Center(child: AppRichText('Welcome', size: 50)),
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
                PlayerButton(
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(1),
                  player: '1',
                ),
                const Spacer(),
                PlayerButton(
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(2),
                  player: '2',
                ),
                const Spacer(),
                PlayerButton(
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(3),
                  player: '3',
                ),
                const Spacer(),
                PlayerButton(
                  onPressed: () =>
                      ref.read(newGamePageControllerProvider).onStartNewGame(4),
                  player: '4',
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

class PlayerButton extends ElevatedButton {
  PlayerButton({required super.onPressed, required String player, super.key})
      : super(style: _buttonStyle, child: AppRichText(player, size: 24));

  static final ButtonStyle _buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.orangeAccent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
  );
}
