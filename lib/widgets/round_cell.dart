import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/adjustable_cell.dart';
import 'package:quest_phase/widgets/ink_well_button.dart';

class RoundCell extends HookConsumerWidget {
  const RoundCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref
        .watch(savedStateNotifierProvider.select((value) => value.round))
        .toString();
    final isHighlighted =
        ref.watch(selectedCellProvider) == CellSelection.round;

    return InkWellButton(
      onTapDown: (_) {
        if (ref.read(selectedCellProvider) != CellSelection.round) {
          HapticFeedback.selectionClick();
        }
      },
      onTap: () {
        ref.read(selectedCellProvider.notifier).state = CellSelection.round;
      },
      child: AdjustableCell(
        isHighlighted: isHighlighted,
        text: text,
        onTapDecrease: () {
          ref.read(savedStateNotifierProvider.notifier).removeRound(1);
          ref.read(selectedCellProvider.notifier).state = CellSelection.round;
        },
        onTapIncrease: () {
          ref.read(savedStateNotifierProvider.notifier).addRound(1);
          ref.read(selectedCellProvider.notifier).state = CellSelection.round;
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
