// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/widgets/number_pad/number_pad.dart';
import 'package:quest_phase/widgets/player_threat_cell.dart';
import 'package:quest_phase/widgets/player_willpower_cell.dart';
import 'package:quest_phase/widgets/round_cell.dart';
import 'package:quest_phase/widgets/staging_threat_cell.dart';
import 'package:quest_phase/widgets/toolbar/toolbar.dart';
import 'package:quest_phase/widgets/total_progress_cell.dart';
import 'package:quest_phase/widgets/total_willpower_cell.dart';

enum LayoutRow { total, gap2, threat, will, info, toolbar, gap, keypad }

class GameGrid extends ConsumerWidget {
  const GameGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerCount = ref.watch(
      savedStateNotifierProvider.select((value) => value.numberOfPlayers),
    );
    return LayoutGrid(
      rowGap: 4,
      columnGap: 4,
      columnSizes: const [auto, auto, auto, auto],
      rowSizes: [auto, 4.px, auto, auto, auto, 48.px, 1.fr, auto],
      children: [
        const RoundCell().withGridPlacement(
          columnStart: 0,
          columnSpan: 2,
          rowStart: LayoutRow.info.index,
          rowSpan: 1,
        ),
        const StagingThreatCell().withGridPlacement(
          columnStart: 2,
          columnSpan: 2,
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
        const PlayerWillpowerCell(
          name: 'P1',
          playerOption: PlayerOption.p1,
          cellSelection: CellSelection.p1will,
        ).withGridPlacement(
          columnStart: 0,
          columnSpan: 1,
          rowStart: LayoutRow.will.index,
          rowSpan: 1,
        ),
        Visibility(
          visible: playerCount > 1,
          child: const PlayerWillpowerCell(
            name: 'P2',
            playerOption: PlayerOption.p2,
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
          child: const PlayerWillpowerCell(
            name: 'P3',
            playerOption: PlayerOption.p3,
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
          child: const PlayerWillpowerCell(
            name: 'P4',
            playerOption: PlayerOption.p4,
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
          rowStart: LayoutRow.toolbar.index,
          rowSpan: 1,
        ),
        const PlayerThreatCell(
          playerOption: PlayerOption.p1,
          cellSelection: CellSelection.p1threat,
        ).withGridPlacement(
          columnStart: 0,
          columnSpan: 1,
          rowStart: LayoutRow.threat.index,
          rowSpan: 1,
        ),
        Visibility(
          visible: playerCount > 1,
          child: const PlayerThreatCell(
            playerOption: PlayerOption.p2,
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
          child: const PlayerThreatCell(
            playerOption: PlayerOption.p3,
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
          child: const PlayerThreatCell(
            playerOption: PlayerOption.p4,
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
