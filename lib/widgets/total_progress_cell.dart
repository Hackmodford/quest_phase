import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/progress_total_provider.dart';
import 'package:quest_phase/widgets/cell.dart';
import 'package:quest_phase/gen/assets.gen.dart';

class TotalProgressCell extends HookConsumerWidget {
  const TotalProgressCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String text = ref.watch(progressTotalProvider).toString();
    return Cell(
      color: ColorName.progressBackground,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.progress.image(
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
