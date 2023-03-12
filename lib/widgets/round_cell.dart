import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/adjustable_cell.dart';

class RoundCell extends HookConsumerWidget {
  const RoundCell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String text = ref.watch(roundProvider).toString();
    final bool isHighlighted =
        ref.watch(selectedCellProvider) == CellSelection.round;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          ref.read(selectedCellProvider.notifier).set(CellSelection.round);
        },
        child: AdjustableCell(
          isHighlighted: isHighlighted,
          text: text,
          onTapDecrease: () {
            ref.read(roundProvider.notifier).remove(1);
            ref.read(selectedCellProvider.notifier).set(CellSelection.round);
          },
          onTapIncrease: () {
            ref.read(roundProvider.notifier).add(1);
            ref.read(selectedCellProvider.notifier).set(CellSelection.round);
          },
          color: ColorName.roundBackground,
          image: Assets.images.clock.image(
            width: 24,
            height: 24,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
