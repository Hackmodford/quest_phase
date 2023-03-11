import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/threat_total_provider.dart';
import 'package:quest_phase/providers/toolbar_state_provider.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/cell.dart';

class Toolbar extends ConsumerWidget {
  const Toolbar({super.key});

  final color = Colors.white10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(toolbarModeProvider);
    const padding = EdgeInsets.only(top: 8);
    switch (mode) {
      case ToolbarModes.none:
        return Container();
      case ToolbarModes.playerThreat:
        return _buildThreatToolbar(context, ref, padding);
      case ToolbarModes.willAndThreat:
        return _buildWillToolbar(context, ref, padding);
      case ToolbarModes.round:
        return _buildRoundToolbar(context, ref, padding);
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
                onTap: () {
                  ref.read(p1ThreatProvider.notifier).decrease();
                  ref.read(p2ThreatProvider.notifier).decrease();
                  ref.read(p3ThreatProvider.notifier).decrease();
                  ref.read(p4ThreatProvider.notifier).decrease();
                },
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
                onTap: () {
                  ref.read(p1ThreatProvider.notifier).increase();
                  ref.read(p2ThreatProvider.notifier).increase();
                  ref.read(p3ThreatProvider.notifier).increase();
                  ref.read(p4ThreatProvider.notifier).increase();
                },
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
                onTap: () {
                  ref.read(stagingThreatProvider.notifier).reset();
                  ref.read(p1WillpowerProvider.notifier).reset();
                  ref.read(p2WillpowerProvider.notifier).reset();
                  ref.read(p3WillpowerProvider.notifier).reset();
                  ref.read(p4WillpowerProvider.notifier).reset();
                },
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
                onTap: () {
                  final selection = ref.read(selectedCellProvider);
                  switch (selection) {
                    case CellSelection.stagingThreat:
                      ref.read(stagingThreatProvider.notifier).remove(1);
                      break;
                    case CellSelection.p1will:
                      ref.read(p1WillpowerProvider.notifier).remove(1);
                      break;
                    case CellSelection.p2will:
                      ref.read(p2WillpowerProvider.notifier).remove(1);
                      break;
                    case CellSelection.p3will:
                      ref.read(p3WillpowerProvider.notifier).remove(1);
                      break;
                    case CellSelection.p4will:
                      ref.read(p4WillpowerProvider.notifier).remove(1);
                      break;
                    default:
                      break;
                  }
                },
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
                onTap: () {
                  final selection = ref.read(selectedCellProvider);
                  switch (selection) {
                    case CellSelection.stagingThreat:
                      ref.read(stagingThreatProvider.notifier).add(1);
                      break;
                    case CellSelection.p1will:
                      ref.read(p1WillpowerProvider.notifier).add(1);
                      break;
                    case CellSelection.p2will:
                      ref.read(p2WillpowerProvider.notifier).add(1);
                      break;
                    case CellSelection.p3will:
                      ref.read(p3WillpowerProvider.notifier).add(1);
                      break;
                    case CellSelection.p4will:
                      ref.read(p4WillpowerProvider.notifier).add(1);
                      break;
                    default:
                      break;
                  }
                },
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
                onTap: () {
                  final selection = ref.read(selectedCellProvider);
                  switch (selection) {
                    case CellSelection.stagingThreat:
                      ref.read(stagingThreatProvider.notifier).add(2);
                      break;
                    case CellSelection.p1will:
                      ref.read(p1WillpowerProvider.notifier).add(2);
                      break;
                    case CellSelection.p2will:
                      ref.read(p2WillpowerProvider.notifier).add(2);
                      break;
                    case CellSelection.p3will:
                      ref.read(p3WillpowerProvider.notifier).add(2);
                      break;
                    case CellSelection.p4will:
                      ref.read(p4WillpowerProvider.notifier).add(2);
                      break;
                    default:
                      break;
                  }
                },
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
                onTap: () {
                  final selection = ref.read(selectedCellProvider);
                  switch (selection) {
                    case CellSelection.stagingThreat:
                      ref.read(stagingThreatProvider.notifier).add(5);
                      break;
                    case CellSelection.p1will:
                      ref.read(p1WillpowerProvider.notifier).add(5);
                      break;
                    case CellSelection.p2will:
                      ref.read(p2WillpowerProvider.notifier).add(5);
                      break;
                    case CellSelection.p3will:
                      ref.read(p3WillpowerProvider.notifier).add(5);
                      break;
                    case CellSelection.p4will:
                      ref.read(p4WillpowerProvider.notifier).add(5);
                      break;
                    default:
                      break;
                  }
                },
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
                onTap: () {
                  ref.read(roundProvider.notifier).increase();
                  ref.read(p1WillpowerProvider.notifier).reset();
                  ref.read(p2WillpowerProvider.notifier).reset();
                  ref.read(p3WillpowerProvider.notifier).reset();
                  ref.read(p4WillpowerProvider.notifier).reset();
                  ref.read(p1ThreatProvider.notifier).increase();
                  ref.read(p2ThreatProvider.notifier).increase();
                  ref.read(p3ThreatProvider.notifier).increase();
                  ref.read(p4ThreatProvider.notifier).increase();
                  if (ref.read(settingShouldResetStagingThreatProvider)) {
                    ref.read(stagingThreatProvider.notifier).reset();
                  }
                },
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
