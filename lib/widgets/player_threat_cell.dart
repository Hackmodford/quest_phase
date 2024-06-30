import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/adjustable_cell.dart';
import 'package:quest_phase/widgets/ink_well_button.dart';

class PlayerThreatCell extends HookConsumerWidget {
  const PlayerThreatCell({
    required this.playerOption,
    required this.cellSelection,
    super.key,
  });

  final PlayerOption playerOption;
  final CellSelection cellSelection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHighlighted = ref.watch(selectedCellProvider) == cellSelection;
    String text;
    switch (playerOption) {
      case PlayerOption.p1:
        text = ref
            .watch(
              savedStateNotifierProvider
                  .select((value) => value.playerState1.threat),
            )
            .toString();
      case PlayerOption.p2:
        text = ref
            .watch(
              savedStateNotifierProvider
                  .select((value) => value.playerState2.threat),
            )
            .toString();
      case PlayerOption.p3:
        text = ref
            .watch(
              savedStateNotifierProvider
                  .select((value) => value.playerState3.threat),
            )
            .toString();
      case PlayerOption.p4:
        text = ref
            .watch(
              savedStateNotifierProvider
                  .select((value) => value.playerState4.threat),
            )
            .toString();
    }

    return InkWellButton(
      onTapDown: (_) {
        if (ref.read(selectedCellProvider) != cellSelection) {
          HapticFeedback.selectionClick();
        }
      },
      onTap: () {
        ref.read(selectedCellProvider.notifier).state = cellSelection;
      },
      child: AdjustableCell(
        isHighlighted: isHighlighted,
        text: text,
        onTapIncrease: () {
          ref.read(savedStateNotifierProvider.notifier).addPlayerThreat(
                playerOption,
                1,
              );
          ref.read(selectedCellProvider.notifier).state = cellSelection;
        },
        onTapDecrease: () {
          ref.read(savedStateNotifierProvider.notifier).removePlayerThreat(
                playerOption,
                1,
              );
          ref.read(selectedCellProvider.notifier).state = cellSelection;
        },
        color: ColorName.threatBackground,
        image: Assets.images.threaticon.image(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
