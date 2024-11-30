// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/gen/fonts.gen.dart';
import 'package:quest_phase/services/sound_effect_service.dart';
import 'package:quest_phase/widgets/cell.dart';
import 'package:quest_phase/widgets/ink_well_button.dart';
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
        NumberButton(
          value: 1,
          columnStart: LayoutColumn.one.index,
          rowStart: 0,
        ),
        NumberButton(
          value: 2,
          columnStart: LayoutColumn.two.index,
          rowStart: 0,
        ),
        NumberButton(
          value: 3,
          columnStart: LayoutColumn.three.index,
          rowStart: 0,
        ),
        NumberButton(
          value: 4,
          columnStart: LayoutColumn.one.index,
          rowStart: 1,
        ),
        NumberButton(
          value: 5,
          columnStart: LayoutColumn.two.index,
          rowStart: 1,
        ),
        NumberButton(
          value: 6,
          columnStart: LayoutColumn.three.index,
          rowStart: 1,
        ),
        NumberButton(
          value: 7,
          columnStart: LayoutColumn.one.index,
          rowStart: 2,
        ),
        NumberButton(
          value: 8,
          columnStart: LayoutColumn.two.index,
          rowStart: 2,
        ),
        NumberButton(
          value: 9,
          columnStart: LayoutColumn.three.index,
          rowStart: 2,
        ),
        ClearButton(
          columnStart: LayoutColumn.one.index,
          rowStart: 3,
        ),
        NumberButton(
          value: 0,
          columnStart: LayoutColumn.two.index,
          rowStart: 3,
        ),
        BackspaceButton(
          columnStart: LayoutColumn.three.index,
          rowStart: 3,
        ),
      ],
    );
  }
}

class BackspaceButton extends ConsumerWidget {
  const BackspaceButton({
    required this.columnStart,
    required this.rowStart,
    super.key,
  });

  final int columnStart;
  final int rowStart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeypadButton(
      onTapDown: (_) {
        ref.read(soundEffectServiceProvider).playDecrease();
        HapticFeedback.mediumImpact();
      },
      onTap: () {
        ref.read(numberPadControllerProvider).onBackspace();
      },
      columnStart: columnStart,
      rowStart: rowStart,
      child: const Icon(Icons.backspace),
    );
  }
}

class ClearButton extends ConsumerWidget {
  const ClearButton({
    required this.columnStart,
    required this.rowStart,
    super.key,
  });

  final int columnStart;
  final int rowStart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeypadButton(
      onTapDown: (_) {
        ref.read(soundEffectServiceProvider).playDecrease();
        HapticFeedback.mediumImpact();
      },
      onTap: () {
        ref.read(numberPadControllerProvider).onClear();
      },
      columnStart: columnStart,
      rowStart: rowStart,
      child: const Text(
        'C',
        style: TextStyle(
          fontSize: 20,
          fontFamily: FontFamily.vafthrudnir,
          height: 0.75,
        ),
      ),
    );
  }
}

class NumberButton extends ConsumerWidget {
  const NumberButton({
    required this.value,
    required this.columnStart,
    required this.rowStart,
    super.key,
  });

  final int value;
  final int columnStart;
  final int rowStart;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return KeypadButton(
      onTapDown: (_) {
        ref.read(soundEffectServiceProvider).playIncrease();
        HapticFeedback.mediumImpact();
        ref.read(numberPadControllerProvider).onNumber(value);
      },
      onTap: () {
      },
      columnStart: columnStart,
      rowStart: rowStart,
      child: Text(
        value.toString(),
        style: const TextStyle(
          fontSize: 20,
          fontFamily: FontFamily.vafthrudnir,
          height: 0.75,
        ),
      ),
    );
  }
}

class KeypadButton extends StatelessWidget {
  const KeypadButton({
    required this.child,
    required this.columnStart,
    required this.rowStart,
    super.key,
    this.onTapDown,
    this.onTap,
  });

  final Widget child;

  final GestureTapDownCallback? onTapDown;
  final GestureTapCallback? onTap;
  final int columnStart;
  final int rowStart;

  @override
  Widget build(BuildContext context) {
    return InkWellButton(
      onTapDown: onTapDown,
      onTap: onTap,
      child: Cell(
        color: Colors.black54,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 19,
            left: 8,
            right: 8,
            bottom: 8,
          ),
          child: child,
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
