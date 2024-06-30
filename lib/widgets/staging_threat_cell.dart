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
import 'package:quest_phase/widgets/ink_well_button.dart';

class StagingThreatCell extends HookConsumerWidget {
  const StagingThreatCell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref
        .watch(
          savedStateNotifierProvider.select((value) => value.stagingThreat),
        )
        .toString();
    final isHighlighted =
        ref.watch(selectedCellProvider) == CellSelection.stagingThreat;

    return InkWellButton(
      onTapDown: (_) {
        if (ref.read(selectedCellProvider) != CellSelection.stagingThreat) {
          HapticFeedback.selectionClick();
        }
      },
      onTap: () {
        ref.read(selectedCellProvider.notifier).state =
            CellSelection.stagingThreat;
      },
      child: Cell(
        isHighlighted: isHighlighted,
        color: ColorName.threatBackground,
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
                child: Assets.images.threat.image(
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
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
    );
  }
}
