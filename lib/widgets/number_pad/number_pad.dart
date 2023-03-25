// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/services/sound_effect_service.dart';
import 'package:quest_phase/widgets/cell.dart';
import 'package:quest_phase/widgets/number_pad/number_pad_controller.dart';

enum LayoutColumn {
  one,
  two,
  three,
}

class NumberPad extends ConsumerWidget {
  const NumberPad({super.key});

  double get fontSize => 20;

  Color get color => Colors.black54;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutGrid(
      rowGap: 8,
      columnGap: 8,
      columnSizes: const [auto, auto, auto],
      rowSizes: const [auto, auto, auto, auto],
      children: [
        _buildNumber(
          context,
          ref,
          value: 1,
          columnStart: LayoutColumn.one.index,
          rowStart: 0,
        ),
        _buildNumber(
          context,
          ref,
          value: 2,
          columnStart: LayoutColumn.two.index,
          rowStart: 0,
        ),
        _buildNumber(
          context,
          ref,
          value: 3,
          columnStart: LayoutColumn.three.index,
          rowStart: 0,
        ),
        _buildNumber(
          context,
          ref,
          value: 4,
          columnStart: LayoutColumn.one.index,
          rowStart: 1,
        ),
        _buildNumber(
          context,
          ref,
          value: 5,
          columnStart: LayoutColumn.two.index,
          rowStart: 1,
        ),
        _buildNumber(
          context,
          ref,
          value: 6,
          columnStart: LayoutColumn.three.index,
          rowStart: 1,
        ),
        _buildNumber(
          context,
          ref,
          value: 7,
          columnStart: LayoutColumn.one.index,
          rowStart: 2,
        ),
        _buildNumber(
          context,
          ref,
          value: 8,
          columnStart: LayoutColumn.two.index,
          rowStart: 2,
        ),
        _buildNumber(
          context,
          ref,
          value: 9,
          columnStart: LayoutColumn.three.index,
          rowStart: 2,
        ),
        _buildClear(
          context,
          ref,
          columnStart: LayoutColumn.one.index,
          rowStart: 3,
        ),
        _buildNumber(
          context,
          ref,
          value: 0,
          columnStart: LayoutColumn.two.index,
          rowStart: 3,
        ),
        _buildBackspace(
          context,
          ref,
          columnStart: LayoutColumn.three.index,
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
        onTapDown: (_) {
          ref.read(soundEffectServiceProvider).playIncrease();
          HapticFeedback.mediumImpact();
        },
        onTap: () {
          ref.read(numberPadControllerProvider).onNumber(value);
        },
        child: Cell(
          color: color,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 19,
              left: 8,
              right: 8,
              bottom: 8,
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
      ),
    ).withGridPlacement(
      columnStart: columnStart,
      columnSpan: 1,
      rowStart: rowStart,
      rowSpan: 1,
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
        onTapDown: (_) {
          ref.read(soundEffectServiceProvider).playDecrease();
          HapticFeedback.mediumImpact();
        },
        onTap: () {
          ref.read(numberPadControllerProvider).onBackspace();
        },
        child: Cell(
          color: color,
          child: const Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
              bottom: 8,
            ),
            child: Icon(Icons.backspace),
          ),
        ),
      ),
    ).withGridPlacement(
      columnStart: columnStart,
      columnSpan: 1,
      rowStart: rowStart,
      rowSpan: 1,
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
        onTapDown: (_) {
          ref.read(soundEffectServiceProvider).playDecrease();
          HapticFeedback.mediumImpact();
        },
        onTap: () {
          ref.read(numberPadControllerProvider).onClear();
        },
        child: Cell(
          color: color,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 19,
              left: 8,
              right: 8,
              bottom: 8,
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
      ),
    ).withGridPlacement(
      columnStart: columnStart,
      columnSpan: 1,
      rowStart: rowStart,
      rowSpan: 1,
    );
  }
}
