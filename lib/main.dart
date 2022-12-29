import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_Provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/threat_total_provider.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:quest_phase/widgets/cell.dart';
import 'package:quest_phase/widgets/player_threat_cell.dart';
import 'package:quest_phase/widgets/player_willpower_cell.dart';
import 'package:quest_phase/widgets/round_cell.dart';
import 'package:quest_phase/widgets/total_progress_cell.dart';
import 'package:quest_phase/widgets/total_threat_cell.dart';
import 'package:quest_phase/widgets/total_willpower_cell.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

enum LayoutRow {
  total,
  will,
  adjustment,
  description1,
  threat,
  threatAdjustment,
  description2,
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: LayoutGrid(
          rowGap: 4,
          columnGap: 4,
          columnSizes: const [auto, auto, auto, auto, auto],
          rowSizes: [auto, auto, auto, auto, auto, auto, auto, 1.fr],
          children: [
            Row(
              children: const [
                Expanded(child: TotalWillpowerCell()),
                SizedBox(width: 4),
                Expanded(child: TotalProgressCell()),
              ],
            ).withGridPlacement(
              columnStart: 0,
              columnSpan: 5,
              rowStart: LayoutRow.total.index,
              rowSpan: 1,
            ),
            const TotalThreatCell().withGridPlacement(
              columnStart: 0,
              columnSpan: 1,
              rowStart: LayoutRow.will.index,
              rowSpan: 1,
            ),
            PlayerWillpowerCell(
              provider: p1WillpowerProvider,
              cellSelection: CellSelection.p1will,
            ).withGridPlacement(
              columnStart: 1,
              columnSpan: 1,
              rowStart: LayoutRow.will.index,
              rowSpan: 1,
            ),
            PlayerWillpowerCell(
              provider: p2WillpowerProvider,
              cellSelection: CellSelection.p2will,
            ).withGridPlacement(
              columnStart: 2,
              columnSpan: 1,
              rowStart: LayoutRow.will.index,
              rowSpan: 1,
            ),
            PlayerWillpowerCell(
              provider: p3WillpowerProvider,
              cellSelection: CellSelection.p3will,
            ).withGridPlacement(
              columnStart: 3,
              columnSpan: 1,
              rowStart: LayoutRow.will.index,
              rowSpan: 1,
            ),
            PlayerWillpowerCell(
              provider: p4WillpowerProvider,
              cellSelection: CellSelection.p4will,
            ).withGridPlacement(
              columnStart: 4,
              columnSpan: 1,
              rowStart: LayoutRow.will.index,
              rowSpan: 1,
            ),
            GestureDetector(
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
            ).withGridPlacement(
              columnStart: 0,
              columnSpan: 1,
              rowStart: LayoutRow.adjustment.index,
              rowSpan: 1,
            ),
            GestureDetector(
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
            ).withGridPlacement(
              columnStart: 1,
              columnSpan: 1,
              rowStart: LayoutRow.adjustment.index,
              rowSpan: 1,
            ),
            GestureDetector(
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
            ).withGridPlacement(
              columnStart: 2,
              columnSpan: 1,
              rowStart: LayoutRow.adjustment.index,
              rowSpan: 1,
            ),
            GestureDetector(
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
            ).withGridPlacement(
              columnStart: 3,
              columnSpan: 1,
              rowStart: LayoutRow.adjustment.index,
              rowSpan: 1,
            ),
            GestureDetector(
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
            ).withGridPlacement(
              columnStart: 4,
              columnSpan: 1,
              rowStart: LayoutRow.adjustment.index,
              rowSpan: 1,
            ),
            const RoundCell().withGridPlacement(
              columnStart: 0,
              columnSpan: 1,
              rowStart: LayoutRow.threat.index,
              rowSpan: 1,
            ),
            PlayerThreatCell(
              provider: p1ThreatProvider,
              cellSelection: CellSelection.p1threat,
            ).withGridPlacement(
              columnStart: 1,
              columnSpan: 1,
              rowStart: LayoutRow.threat.index,
              rowSpan: 1,
            ),
            PlayerThreatCell(
              provider: p2ThreatProvider,
              cellSelection: CellSelection.p2threat,
            ).withGridPlacement(
              columnStart: 2,
              columnSpan: 1,
              rowStart: LayoutRow.threat.index,
              rowSpan: 1,
            ),
            PlayerThreatCell(
              provider: p3ThreatProvider,
              cellSelection: CellSelection.p3threat,
            ).withGridPlacement(
              columnStart: 3,
              columnSpan: 1,
              rowStart: LayoutRow.threat.index,
              rowSpan: 1,
            ),
            PlayerThreatCell(
              provider: p4ThreatProvider,
              cellSelection: CellSelection.p4threat,
            ).withGridPlacement(
              columnStart: 4,
              columnSpan: 1,
              rowStart: LayoutRow.threat.index,
              rowSpan: 1,
            ),
            GestureDetector(
              onTap: () {
                ref.read(roundProvider.notifier).increase();
                ref.read(p1ThreatProvider.notifier).increase();
                ref.read(p2ThreatProvider.notifier).increase();
                ref.read(p3ThreatProvider.notifier).increase();
                ref.read(p4ThreatProvider.notifier).increase();
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
                    'New\nRound',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ).withGridPlacement(
              columnStart: 0,
              columnSpan: 1,
              rowStart: LayoutRow.threatAdjustment.index,
              rowSpan: 1,
            ),
            GestureDetector(
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
                  child: Text('-1 All Players'),
                ),
              ),
            ).withGridPlacement(
              columnStart: 1,
              columnSpan: 2,
              rowStart: LayoutRow.threatAdjustment.index,
              rowSpan: 1,
            ),
            GestureDetector(
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
                  child: Text('+1 All Players'),
                ),
              ),
            ).withGridPlacement(
              columnStart: 3,
              columnSpan: 2,
              rowStart: LayoutRow.threatAdjustment.index,
              rowSpan: 1,
            ),
            const Cell(
              color: Colors.black54,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tap a value above to select it. Then use the buttons above to adjust the value or use the numpad below to set it manually. Tap the "P1" label to input different initials.',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ).withGridPlacement(
              columnStart: 0,
              columnSpan: 5,
              rowStart: LayoutRow.description1.index,
              rowSpan: 1,
            ),
            const Cell(
              color: Colors.black54,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Use the -/+ buttons to adjust the values above, or tap on a value to select it and use the numpad below to enter it manually.',
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ).withGridPlacement(
              columnStart: 0,
              columnSpan: 5,
              rowStart: LayoutRow.description2.index,
              rowSpan: 1,
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
