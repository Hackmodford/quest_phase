import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/cell.dart';
import 'package:quest_phase/widgets/toolbar/toolbar_controller.dart';

enum Mode { none, playerThreat, willAndThreat, round }

class Toolbar extends HookConsumerWidget {
  const Toolbar({super.key});

  final color = Colors.white10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final mode = useState(ref.read(selectedCellProvider).toMode());

    ref.listen(selectedCellProvider, (previous, next) {
      mode.value = next.toMode();
    });

    const padding = EdgeInsets.only(top: 8);
    switch (mode.value) {
      case Mode.none:
        return Container();
      case Mode.playerThreat:
        return _buildThreatToolbar(context, ref, padding);
      case Mode.willAndThreat:
        return _buildWillToolbar(context, ref, padding);
      case Mode.round:
        return _buildRoundToolbar(context, ref, padding);
      default:
        return Container();
    }
  }

  Widget _buildThreatToolbar(BuildContext context, WidgetRef ref, EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onRemoveOneThreatFromAllPlayers(),
                child: Cell(
                  color: color,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0, top:4.0, right:8.0, bottom:8.0),
                    child: buildRichText('-1 All Players', 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onAddOneThreatToAllPlayers(),
                child: Cell(
                  color: color,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0, top:4.0, right:8.0, bottom:8.0),
                    child: buildRichText('+1 All Players', 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWillToolbar(BuildContext context, WidgetRef ref, EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onClearAll(),
                child: Cell(
                  color: color,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0, right:8.0, bottom:8.0, top:4.0),
                    child: buildRichText('Clear\n All', 20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onRemoveOne(),
                child: Cell(
                  color: color,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('-1', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onAddOne(),
                child: Cell(
                  color: color,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('+1', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onAddTwo(),
                child: Cell(
                  color: color,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('+2', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onAddFive(),
                child: Cell(
                  color: color,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('+5', style: TextStyle(fontSize: 24),),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundToolbar(BuildContext context, WidgetRef ref, EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () => ref.read(toolbarControllerProvider).onRefreshAndNewRound(),
                child: Cell(
                  color: color,
                  child: Padding(
                    padding: const EdgeInsets.only(left:8.0, top:4.0, right:8.0, bottom:8.0),
                    child: buildRichText('Refresh + New Round', 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

extension CellSelectionExtensions on CellSelection {
  Mode toMode()
  {
    switch (this) {
      case CellSelection.p1will:
      case CellSelection.p2will:
      case CellSelection.p3will:
      case CellSelection.p4will:
      case CellSelection.stagingThreat:
        return Mode.willAndThreat;
      case CellSelection.round:
        return Mode.round;
      case CellSelection.p1threat:
      case CellSelection.p2threat:
      case CellSelection.p3threat:
      case CellSelection.p4threat:
        return Mode.playerThreat;
    }
  }
}
