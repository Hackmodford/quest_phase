import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/cell.dart';

class PlayerWillpowerCell extends HookConsumerWidget {
  const PlayerWillpowerCell({
    required this.playerOption,
    required this.cellSelection,
    required this.name,
    super.key,
  });

  final String name;
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
                  .select((value) => value.playerState1.willpower),
            )
            .toString();
        break;
      case PlayerOption.p2:
        text = ref
            .watch(
          savedStateNotifierProvider
              .select((value) => value.playerState2.willpower),
        )
            .toString();
        break;
      case PlayerOption.p3:
        text = ref
            .watch(
          savedStateNotifierProvider
              .select((value) => value.playerState3.willpower),
        )
            .toString();
        break;
      case PlayerOption.p4:
        text = ref
            .watch(
          savedStateNotifierProvider
              .select((value) => value.playerState4.willpower),
        )
            .toString();
        break;
    }

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () async {
          await HapticFeedback.selectionClick();
          ref.read(selectedCellProvider.notifier).state = cellSelection;
        },
        child: Cell(
          isHighlighted: isHighlighted,
          color: ColorName.willpowerBackground,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.willpower.image(
                        width: 24,
                        height: 24,
                        fit: BoxFit.scaleDown,
                      ),
                      4.widthBox,
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          name,
                        ),
                      ),
                    ],
                  ),
                ),
                4.heightBox,
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        text,
                        style: const TextStyle(
                          height: 0.75,
                          fontFamily: FontFamily.vafthrudnir,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
