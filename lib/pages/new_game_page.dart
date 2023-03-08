import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/router_provider.dart';
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
                onPressed: () => ref.read(routerProvider).go('/game'),
                child: buildRichText('New Game', 24))
          ],
        ),
      ),
    );
  }
}
