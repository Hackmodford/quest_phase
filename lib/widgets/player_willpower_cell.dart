import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/assets.gen.dart';
import 'package:quest_phase/gen/colors.gen.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/utils/counter_notifier.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/cell.dart';

class PlayerWillpowerCell extends HookConsumerWidget {
  final String name;
  final NotifierProvider<CounterNotifier, int> provider;
  final CellSelection cellSelection;

  const PlayerWillpowerCell(
      {Key? key, required this.provider, required this.cellSelection, required this.name,})
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
        child: Cell(
          isHighlighted: isHighlighted,
          color: ColorName.willpowerBackground,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2.0, top: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.images.willpower.image(
                        width: 24,
                        height: 24,
                        fit: BoxFit.scaleDown,
                      ),
                      const SizedBox(width: 4.0,),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(name,),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.black54,
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
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
