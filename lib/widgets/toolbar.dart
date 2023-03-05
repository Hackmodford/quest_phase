import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_Provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/threat_total_provider.dart';
import 'package:quest_phase/providers/toolbar_state_provider.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:quest_phase/widgets/cell.dart';

class Toolbar extends ConsumerWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(toolbarModeProvider);
    const padding = EdgeInsets.only(top: 8);
    switch (mode) {
      case ToolbarMode.none:
        return Container();
      case ToolbarMode.playerThreat:
        return _buildThreatToolbar(context, ref, padding);
      case ToolbarMode.willAndThreat:
        return _buildWillToolbar(context, ref, padding);
      case ToolbarMode.round:
        return _buildRoundToolbar(context, ref, padding);
    }
  }

  Widget _buildThreatToolbar(BuildContext context, WidgetRef ref, EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(p1ThreatProvider.notifier).decrease();
                ref.read(p2ThreatProvider.notifier).decrease();
                ref.read(p3ThreatProvider.notifier).decrease();
                ref.read(p4ThreatProvider.notifier).decrease();
              },
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-1 All PLayers'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(p1ThreatProvider.notifier).increase();
                ref.read(p2ThreatProvider.notifier).increase();
                ref.read(p3ThreatProvider.notifier).increase();
                ref.read(p4ThreatProvider.notifier).increase();
              },
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('+1 All PLayers'),
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
            child: GestureDetector(
              onTap: () {
                ref.read(threatTotalProvider.notifier).reset();
                ref.read(p1WillpowerProvider.notifier).reset();
                ref.read(p2WillpowerProvider.notifier).reset();
                ref.read(p3WillpowerProvider.notifier).reset();
                ref.read(p4WillpowerProvider.notifier).reset();
              },
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Clear\nAll',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: () {
                final selection = ref.read(selectedCellProvider);
                switch (selection) {
                  case CellSelection.threat:
                    ref.read(threatTotalProvider.notifier).remove(1);
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
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-1'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: () {
                final selection = ref.read(selectedCellProvider);
                switch (selection) {
                  case CellSelection.threat:
                    ref.read(threatTotalProvider.notifier).add(1);
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
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('+1'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: () {
                final selection = ref.read(selectedCellProvider);
                switch (selection) {
                  case CellSelection.threat:
                    ref.read(threatTotalProvider.notifier).add(2);
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
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('+2'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: GestureDetector(
              onTap: () {
                final selection = ref.read(selectedCellProvider);
                switch (selection) {
                  case CellSelection.threat:
                    ref.read(threatTotalProvider.notifier).add(5);
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
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('+5'),
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
            child: GestureDetector(
              onTap: () {
                ref.read(threatTotalProvider.notifier).reset();
                ref.read(p1WillpowerProvider.notifier).reset();
                ref.read(p2WillpowerProvider.notifier).reset();
                ref.read(p3WillpowerProvider.notifier).reset();
                ref.read(p4WillpowerProvider.notifier).reset();
                ref.read(roundProvider.notifier).increase();
                ref.read(threatTotalProvider.notifier).reset();
                ref.read(p1ThreatProvider.notifier).increase();
                ref.read(p2ThreatProvider.notifier).increase();
                ref.read(p3ThreatProvider.notifier).increase();
                ref.read(p4ThreatProvider.notifier).increase();
              },
              child: const Cell(
                color: Colors.black54,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Refresh + New Round',
                    textAlign: TextAlign.center,
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