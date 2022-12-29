import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/willpower_total_provider.dart';
import 'package:quest_phase/widgets/cell.dart';

class TotalWillpowerCell extends HookConsumerWidget {
  const TotalWillpowerCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String text = ref.watch(willpowerTotalProvider).toString();
    return Cell(
      color: ColorName.willpowerBackground,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.willpower.image(
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'Total',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              text,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
