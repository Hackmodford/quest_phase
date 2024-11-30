import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/services/sound_effect_service.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/cell.dart';
import 'package:quest_phase/widgets/ink_well_button.dart';
import 'package:quest_phase/widgets/toolbar/toolbar_controller.dart';

enum Mode { none, playerThreat, willAndThreat, round }

class Toolbar extends HookConsumerWidget {
  const Toolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = useState(ref.read(selectedCellProvider).toMode());

    ref.listen(selectedCellProvider, (previous, next) {
      mode.value = next.toMode();
    });

    switch (mode.value) {
      case Mode.none:
        return Container();
      case Mode.playerThreat:
        return const ThreatToolbar();
      case Mode.willAndThreat:
        return const WillToolbar();
      case Mode.round:
        return const RoundToolbar();
    }
  }
}

class RoundToolbar extends ConsumerWidget {
  const RoundToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact();
              ref.read(soundEffectServiceProvider).playIncrease();
              ref.read(toolbarControllerProvider).onRefreshAndNewRound();
            },
            onTap: () {
            },
            child: const AppRichText('Refresh + New Round', size: 20),
          ),
        ],
      ),
    );
  }
}

class ThreatToolbar extends ConsumerWidget {
  const ThreatToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact();
              ref.read(soundEffectServiceProvider).playDecrease();
            },
            onTap: () {
              ref
                  .read(toolbarControllerProvider)
                  .onRemoveOneThreatFromAllPlayers();
            },
            child: const AppRichText('-1 All Players', size: 20)
                .paddingOnly(bottom: 4),
          ),
          4.widthBox,
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact();
              ref.read(soundEffectServiceProvider).playIncrease();
              ref.read(toolbarControllerProvider).onAddOneThreatToAllPlayers();
            },
            onTap: () {
            },
            child: const AppRichText('+1 All Players', size: 20)
                .paddingOnly(top: 3, bottom: 4),
          ),
        ],
      ),
    );
  }
}

class WillToolbar extends ConsumerWidget {
  const WillToolbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact();
              ref.read(soundEffectServiceProvider).playDecrease();
            },
            onTap: () {
              ref.read(toolbarControllerProvider).onClearAll();
            },
            child: const AppRichText('Clear\n All', size: 14),
          ),
          4.widthBox,
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact();
              ref.read(soundEffectServiceProvider).playDecrease();
            },
            onTap: () {
              ref.read(toolbarControllerProvider).onRemoveOne();
            },
            child: const Text(
              '-1',
              style: TextStyle(fontSize: 24),
            ),
          ),
          4.widthBox,
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact();
              ref.read(soundEffectServiceProvider).playIncrease();
              ref.read(toolbarControllerProvider).onAddOne();
            },
            onTap: () {
            },
            child: const Text(
              '+1',
              style: TextStyle(fontSize: 24),
            ).paddingOnly(top: 4),
          ),
          4.widthBox,
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact();
              ref.read(soundEffectServiceProvider).playIncrease();
              ref.read(toolbarControllerProvider).onAddTwo();
            },
            onTap: () {
            },
            child: const Text(
              '+2',
              style: TextStyle(fontSize: 24),
            ).paddingOnly(top: 4),
          ),
          4.widthBox,
          ToolbarButton(
            onTapDown: (_) {
              HapticFeedback.mediumImpact().ignore();
              ref.read(soundEffectServiceProvider).playIncrease();
              ref.read(toolbarControllerProvider).onAddFive();
            },
            onTap: () {
            },
            child: const Text(
              '+5',
              style: TextStyle(fontSize: 24),
            ).paddingOnly(top: 4),
          ),
        ],
      ),
    );
  }
}

class ToolbarButton extends StatelessWidget {
  const ToolbarButton({
    required this.child,
    this.onTap,
    this.onTapDown,
    this.onTapCancel,
    super.key,
  });

  final GestureTapDownCallback? onTapDown;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onTapCancel;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // improves performance by moving onTapDown away from Inkwell
      child: InkWellButton(
        onTapDown: onTapDown,
        onTapCancel: onTapCancel,
        onTap: onTap,
        child: Cell(
          color: Colors.white10,
          child: child,
        ),
      ),
    );
  }
}

extension CellSelectionExtensions on CellSelection {
  Mode toMode() {
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
