import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/widgets/cell.dart';

class NumberPad extends HookConsumerWidget {
  NumberPad({Key? key}) : super(key: key);

  final int size = 48;
  final double fontSize = 20.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutGrid(
      rowGap: 8,
      columnGap: 8,
      columnSizes: [auto, size.px, size.px, size.px, auto],
      rowSizes: [size.px, size.px, size.px, size.px],
      children: [
        Container().withGridPlacement(
          columnStart: 0,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 4,
        ),
        Container().withGridPlacement(
          columnStart: 4,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 4,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '1',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 1,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '2',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 2,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '3',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 3,
          columnSpan: 1,
          rowStart: 0,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '4',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 1,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '5',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 2,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '6',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 3,
          columnSpan: 1,
          rowStart: 1,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '7',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 1,
          columnSpan: 1,
          rowStart: 2,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '8',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 2,
          columnSpan: 1,
          rowStart: 2,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '9',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 3,
          columnSpan: 1,
          rowStart: 2,
          rowSpan: 1,
        ),
        Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Clear',
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ).withGridPlacement(
          columnStart: 1,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 1,
        ),
        const Cell(
          color: Colors.black54,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '0',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ).withGridPlacement(
          columnStart: 2,
          columnSpan: 1,
          rowStart: 3,
          rowSpan: 1,
        ),
        // Cell(
        //   color: Colors.black54,
        //   child: Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Text(
        //       '',
        //       style: TextStyle(fontSize: fontSize),
        //     ),
        //   ),
        // ).withGridPlacement(
        //   columnStart: 3,
        //   columnSpan: 1,
        //   rowStart: 3,
        //   rowSpan: 1,
        // ),
      ],
    );
  }
}
