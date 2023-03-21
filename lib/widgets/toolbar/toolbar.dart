import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/services/sound_effect_service.dart';
import 'package:quest_phase/utils/font_utils.dart';
import 'package:quest_phase/widgets/cell.dart';
import 'package:quest_phase/widgets/toolbar/toolbar_controller.dart';

enum Mode { none, playerThreat, willAndThreat, round }

class Toolbar extends HookConsumerWidget {
  const Toolbar({super.key});

  Color get color => Colors.white10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = useState(ref.read(selectedCellProvider).toMode());

    ref.listen(selectedCellProvider, (previous, next) {
      mode.value = next.toMode();
    });

    const padding = EdgeInsets.only(top: 8);
    switch (mode.value) {
      case Mode.none:
        return Container();
      case Mode.playerThreat:
        return _buildThreatToolbar(context, ref, padding);
      case Mode.willAndThreat:
        return _buildWillToolbar(context, ref, padding);
      case Mode.round:
        return _buildRoundToolbar(context, ref, padding);
    }
  }

  Widget _buildThreatToolbar(
    BuildContext context,
    WidgetRef ref,
    EdgeInsetsGeometry padding,
  ) {
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
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playDecrease();
                  ref
                    .read(toolbarControllerProvider)
                    .onRemoveOneThreatFromAllPlayers();
                },
                child: Cell(
                  color: color,
                  child: buildRichText('-1 All Players', 20)
                      .paddingOnly(bottom: 4),
                ),
              ),
            ),
          ),
          4.widthBox,
          Expanded(
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(4),
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playIncrease();
                  ref
                    .read(toolbarControllerProvider)
                    .onAddOneThreatToAllPlayers();
                },
                child: Cell(
                  color: color,
                  child: buildRichText('+1 All Players', 20)
                      .paddingOnly(top: 3, bottom: 4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWillToolbar(
    BuildContext context,
    WidgetRef ref,
    EdgeInsetsGeometry padding,
  ) {
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
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playDecrease();
                  ref.read(toolbarControllerProvider).onClearAll();
                },
                child: Cell(
                  color: color,
                  child: buildRichText('Clear\n All', 14),
                ),
              ),
            ),
          ),
          4.widthBox,
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playDecrease();
                  ref.read(toolbarControllerProvider).onRemoveOne();
                },
                child: Cell(
                  color: color,
                  child: const Text(
                    '-1',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          4.widthBox,
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playIncrease();
                  ref.read(toolbarControllerProvider).onAddOne();
                },
                child: Cell(
                  color: color,
                  child: const Text(
                    '+1',
                    style: TextStyle(fontSize: 24),
                  ).paddingOnly(top: 4),
                ),
              ),
            ),
          ),
          4.widthBox,
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playIncrease();
                  ref.read(toolbarControllerProvider).onAddTwo();
                },
                child: Cell(
                  color: color,
                  child: const Text(
                    '+2',
                    style: TextStyle(fontSize: 24),
                  ).paddingOnly(top: 4),
                ),
              ),
            ),
          ),
          4.widthBox,
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(4),
              elevation: 4,
              child: InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playIncrease();
                  ref.read(toolbarControllerProvider).onAddFive();
                },
                child: Cell(
                  color: color,
                  child: const Text(
                    '+5',
                    style: TextStyle(fontSize: 24),
                  ).paddingOnly(top: 4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundToolbar(
    BuildContext context,
    WidgetRef ref,
    EdgeInsetsGeometry padding,
  ) {
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
                onTap: () async {
                  await HapticFeedback.mediumImpact();
                  await ref.read(soundEffectServiceProvider).playIncrease();
                  ref.read(toolbarControllerProvider).onRefreshAndNewRound();
                },
                child: Cell(
                  color: color,
                  child: buildRichText('Refresh + New Round', 20),
                ),
              ),
            ),
          ),
        ],
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
