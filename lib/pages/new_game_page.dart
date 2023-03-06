import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/router_provider.dart';

class NewGamePage extends ConsumerWidget {
  const NewGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Center(child: Text('Welcome')),
            ElevatedButton(
                onPressed: () => ref.read(routerProvider).go('/game'),
                child: const Text('New Game'))
          ],
        ),
      ),
    );
  }
}
