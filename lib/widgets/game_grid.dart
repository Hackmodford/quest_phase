import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/player_count_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:quest_phase/widgets/number_pad.dart';
import 'package:quest_phase/widgets/player_threat_cell.dart';
import 'package:quest_phase/widgets/player_willpower_cell.dart';
import 'package:quest_phase/widgets/round_cell.dart';
import 'package:quest_phase/widgets/staging_threat_cell.dart';
import 'package:quest_phase/widgets/toolbar.dart';
import 'package:quest_phase/widgets/total_progress_cell.dart';
import 'package:quest_phase/widgets/total_willpower_cell.dart';

enum LayoutRow {
  threat,
  will,
  info,
  total,
  threatAdjustment,
  gap,
  keypad
}

class GameGrid extends ConsumerWidget {
  const GameGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerCount = ref.watch(playerCountProvider);
    return LayoutGrid(
      rowGap: 4,
      columnGap: 4,
      columnSizes: const [auto, auto, auto, auto],
      rowSizes: [auto, auto, auto, auto, auto, 1.fr, auto],
      children: [
        const RoundCell().withGridPlacement(
          columnStart: 0,
          columnSpan: 1,
          rowStart: LayoutRow.info.index,
          rowSpan: 1,
        ),
        const StagingThreatCell().withGridPlacement(
          columnStart: 1,
          columnSpan: 3,
          rowStart: LayoutRow.info.index,
          rowSpan: 1,
        ),
        const TotalWillpowerCell().withGridPlacement(
          columnStart: 0,
          columnSpan: 2,
          rowStart: LayoutRow.total.index,
          rowSpan: 1,
        ),
        const TotalProgressCell().withGridPlacement(
          columnStart: 2,
          columnSpan: 2,
          rowStart: LayoutRow.total.index,
          rowSpan: 1,
        ),
        PlayerWillpowerCell(
          name: 'P1',
          provider: p1WillpowerProvider,
          cellSelection: CellSelection.p1will,
        ).withGridPlacement(
          columnStart: 0,
          columnSpan: 1,
          rowStart: LayoutRow.will.index,
          rowSpan: 1,
        ),
        Visibility(
          visible: playerCount > 1,
          child: PlayerWillpowerCell(
            name: 'P2',
            provider: p2WillpowerProvider,
            cellSelection: CellSelection.p2will,
          ).withGridPlacement(
            columnStart: 1,
            columnSpan: 1,
            rowStart: LayoutRow.will.index,
            rowSpan: 1,
          ),
        ),

        Visibility(
          visible: playerCount > 2,
          child: PlayerWillpowerCell(
            name: 'P3',
            provider: p3WillpowerProvider,
            cellSelection: CellSelection.p3will,
          ).withGridPlacement(
            columnStart: 2,
            columnSpan: 1,
            rowStart: LayoutRow.will.index,
            rowSpan: 1,
          ),
        ),
        Visibility(
          visible: playerCount > 3,
          child: PlayerWillpowerCell(
            name: 'P4',
            provider: p4WillpowerProvider,
            cellSelection: CellSelection.p4will,
          ).withGridPlacement(
            columnStart: 3,
            columnSpan: 1,
            rowStart: LayoutRow.will.index,
            rowSpan: 1,
          ),
        ),
        const Toolbar().withGridPlacement(
          columnStart: 0,
          columnSpan: 4,
          rowStart: LayoutRow.threatAdjustment.index,
          rowSpan: 1,
        ),
        PlayerThreatCell(
          provider: p1ThreatProvider,
          cellSelection: CellSelection.p1threat,
        ).withGridPlacement(
          columnStart: 0,
          columnSpan: 1,
          rowStart: LayoutRow.threat.index,
          rowSpan: 1,
        ),
        Visibility(
          visible: playerCount > 1,
          child: PlayerThreatCell(
            provider: p2ThreatProvider,
            cellSelection: CellSelection.p2threat,
          ).withGridPlacement(
            columnStart: 1,
            columnSpan: 1,
            rowStart: LayoutRow.threat.index,
            rowSpan: 1,
          ),
        ),
        Visibility(
          visible: playerCount > 2,
          child: PlayerThreatCell(
            provider: p3ThreatProvider,
            cellSelection: CellSelection.p3threat,
          ).withGridPlacement(
            columnStart: 2,
            columnSpan: 1,
            rowStart: LayoutRow.threat.index,
            rowSpan: 1,
          ),
        ),
        Visibility(
          visible: playerCount > 3,
          child: PlayerThreatCell(
            provider: p4ThreatProvider,
            cellSelection: CellSelection.p4threat,
          ).withGridPlacement(
            columnStart: 3,
            columnSpan: 1,
            rowStart: LayoutRow.threat.index,
            rowSpan: 1,
          ),
        ),
        const NumberPad().withGridPlacement(
          columnStart: 0,
          columnSpan: 4,
          rowStart: LayoutRow.keypad.index,
          rowSpan: 1,
        ),
      ],
    );
  }
}
