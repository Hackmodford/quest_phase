import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/providers/number_pad_controller_provider.dart';
import 'package:quest_phase/widgets/cell.dart';

class NumberPad extends ConsumerWidget {
  const NumberPad({Key? key}) : super(key: key);

  final int size = 48;
  final double fontSize = 20.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutGrid(
      rowGap: 8,
      columnGap: 8,
      columnSizes: const [auto, auto, auto, auto, auto],
      rowSizes: const [auto, auto, auto, auto],
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
        _buildNumber(
          context,
          ref,
          value: 1,
          columnStart: 1,
          rowStart: 0,
        ),
        _buildNumber(
          context,
          ref,
          value: 2,
          columnStart: 2,
          rowStart: 0,
        ),
        _buildNumber(
          context,
          ref,
          value: 3,
          columnStart: 3,
          rowStart: 0,
        ),
        _buildNumber(
          context,
          ref,
          value: 4,
          columnStart: 1,
          rowStart: 1,
        ),
        _buildNumber(
          context,
          ref,
          value: 5,
          columnStart: 2,
          rowStart: 1,
        ),
        _buildNumber(
          context,
          ref,
          value: 6,
          columnStart: 3,
          rowStart: 1,
        ),
        _buildNumber(
          context,
          ref,
          value: 7,
          columnStart: 1,
          rowStart: 2,
        ),
        _buildNumber(
          context,
          ref,
          value: 8,
          columnStart: 2,
          rowStart: 2,
        ),
        _buildNumber(
          context,
          ref,
          value: 9,
          columnStart: 3,
          rowStart: 2,
        ),
        _buildClear(
          context,
          ref,
          columnStart: 1,
          rowStart: 3,
        ),
        _buildNumber(
          context,
          ref,
          value: 0,
          columnStart: 2,
          rowStart: 3,
        ),
        _buildBackspace(
          context,
          ref,
          columnStart: 3,
          rowStart: 3,
        ),
      ],
    );
  }

  Widget _buildNumber(
    BuildContext context,
    WidgetRef ref, {
    required int value,
    required int columnStart,
    required int rowStart,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => ref.read(numberPadControllerProvider).onNumber(value),
        child: Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 19.0,
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Text(
              value.toString(),
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: FontFamily.vafthrudnir,
                height: 0.75,
              ),
            ),
          ),
        ),
      ).withGridPlacement(
        columnStart: columnStart,
        columnSpan: 1,
        rowStart: rowStart,
        rowSpan: 1,
      ),
    );
  }

  Widget _buildBackspace(
    BuildContext context,
    WidgetRef ref, {
    required int columnStart,
    required int rowStart,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => ref.read(numberPadControllerProvider).onBackspace(),
        child: const Cell(
          color: Colors.black54,
          child: Padding(
            padding: EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Icon(Icons.backspace)
          ),
        ),
      ).withGridPlacement(
        columnStart: columnStart,
        columnSpan: 1,
        rowStart: rowStart,
        rowSpan: 1,
      ),
    );
  }

  Widget _buildClear(
    BuildContext context,
    WidgetRef ref, {
    required int columnStart,
    required int rowStart,
  }) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () => ref.read(numberPadControllerProvider).onClear(),
        child: Cell(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 19.0,
              left: 8.0,
              right: 8.0,
              bottom: 8.0,
            ),
            child: Text(
              'C',
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: FontFamily.vafthrudnir,
                height: 0.75,
              ),
            ),
          ),
        ),
      ).withGridPlacement(
        columnStart: columnStart,
        columnSpan: 1,
        rowStart: rowStart,
        rowSpan: 1,
      ),
    );
  }
}
