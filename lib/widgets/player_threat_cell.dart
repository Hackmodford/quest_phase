import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/providers/utils/counter_notifier.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/adjustable_cell.dart';

class PlayerThreatCell extends HookConsumerWidget {
  final NotifierProvider<CounterNotifier, int> provider;
  final CellSelection cellSelection;

  const PlayerThreatCell(

      {Key? key, required this.provider, required this.cellSelection})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String text = ref.watch(provider).toString();
    final bool isHighlighted =
        ref.watch(selectedCellProvider) == cellSelection;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          ref.read(selectedCellProvider.notifier).set(cellSelection);
        },
        child: AdjustableCell(
          isHighlighted: isHighlighted,
          text: text,
          onTapIncrease: () {
            ref.read(provider.notifier).add(1);
            ref.read(selectedCellProvider.notifier).set(cellSelection);
          },
          onTapDecrease: () {
            ref.read(provider.notifier).remove(1);
            ref.read(selectedCellProvider.notifier).set(cellSelection);
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
