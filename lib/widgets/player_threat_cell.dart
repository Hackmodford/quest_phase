import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/adjustable_cell.dart';

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
        break;
      case PlayerOption.p2:
        text = ref
            .watch(
              savedStateNotifierProvider
                  .select((value) => value.playerState2.threat),
            )
            .toString();
        break;
      case PlayerOption.p3:
        text = ref
            .watch(
              savedStateNotifierProvider
                  .select((value) => value.playerState3.threat),
            )
            .toString();
        break;
      case PlayerOption.p4:
        text = ref
            .watch(
              savedStateNotifierProvider
                  .select((value) => value.playerState4.threat),
            )
            .toString();
        break;
    }

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
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
      ),
    );
  }
}
