import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_Provider.dart';
import 'package:quest_phase/widgets/adjustable_cell.dart';

class RoundCell extends HookConsumerWidget {
  const RoundCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String text = ref.watch(roundProvider).toString();
    final bool isHighlighted =
        ref.watch(selectedCellProvider) == CellSelection.round;

    return GestureDetector(
      onTap: () {
        ref.read(selectedCellProvider.notifier).set(CellSelection.round);
      },
      child: AdjustableCell(
        isHighlighted: isHighlighted,
        text: text,
        onTapDecrease: () {
          ref.read(roundProvider.notifier).decrease();
        },
        onTapIncrease: () {
          ref.read(roundProvider.notifier).increase();
        },
        color: ColorName.roundBackground,
        image: Assets.images.clock.image(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
