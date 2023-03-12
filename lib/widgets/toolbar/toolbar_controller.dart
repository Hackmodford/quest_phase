import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:quest_phase/providers/staging_threat_provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toolbar_controller.g.dart';

@riverpod
ToolbarController toolbarController(ToolbarControllerRef ref) => ToolbarController(ref);

class ToolbarController {
  final Ref ref;

  ToolbarController(this.ref);

  void onRemoveOneThreatFromAllPlayers()
  {
    ref.read(p1ThreatProvider.notifier).remove(1);
    ref.read(p2ThreatProvider.notifier).remove(1);
    ref.read(p3ThreatProvider.notifier).remove(1);
    ref.read(p4ThreatProvider.notifier).remove(1);
  }

  void onAddOneThreatToAllPlayers()
  {
    ref.read(p1ThreatProvider.notifier).add(1);
    ref.read(p2ThreatProvider.notifier).add(1);
    ref.read(p3ThreatProvider.notifier).add(1);
    ref.read(p4ThreatProvider.notifier).add(1);
  }

  void onClearAll()
  {
    ref.read(stagingThreatProvider.notifier).reset();
    ref.read(p1WillpowerProvider.notifier).reset();
    ref.read(p2WillpowerProvider.notifier).reset();
    ref.read(p3WillpowerProvider.notifier).reset();
    ref.read(p4WillpowerProvider.notifier).reset();
  }

  void onRemoveOne()
  {
    _onRemove(1);
  }

  void onAddOne()
  {
    _onAdd(1);
  }

  void onAddTwo()
  {
    _onAdd(2);
  }

  void onAddFive()
  {
    _onAdd(5);
  }

  void onRefreshAndNewRound()
  {
    ref.read(roundProvider.notifier).add(1);
    ref.read(p1WillpowerProvider.notifier).reset();
    ref.read(p2WillpowerProvider.notifier).reset();
    ref.read(p3WillpowerProvider.notifier).reset();
    ref.read(p4WillpowerProvider.notifier).reset();
    ref.read(p1ThreatProvider.notifier).add(1);
    ref.read(p2ThreatProvider.notifier).add(1);
    ref.read(p3ThreatProvider.notifier).add(1);
    ref.read(p4ThreatProvider.notifier).add(1);
    if (ref.read(settingShouldResetStagingThreatProvider)) {
      ref.read(stagingThreatProvider.notifier).reset();
    }
  }

  void _onAdd(int value)
  {
    final selection = ref.read(selectedCellProvider);
    switch (selection) {
      case CellSelection.stagingThreat:
        ref.read(stagingThreatProvider.notifier).add(value);
        break;
      case CellSelection.p1will:
        ref.read(p1WillpowerProvider.notifier).add(value);
        break;
      case CellSelection.p2will:
        ref.read(p2WillpowerProvider.notifier).add(value);
        break;
      case CellSelection.p3will:
        ref.read(p3WillpowerProvider.notifier).add(value);
        break;
      case CellSelection.p4will:
        ref.read(p4WillpowerProvider.notifier).add(value);
        break;
      default:
        break;
    }
  }

  void _onRemove(int value)
  {
    final selection = ref.read(selectedCellProvider);
    switch (selection) {
      case CellSelection.stagingThreat:
        ref.read(stagingThreatProvider.notifier).remove(value);
        break;
      case CellSelection.p1will:
        ref.read(p1WillpowerProvider.notifier).remove(value);
        break;
      case CellSelection.p2will:
        ref.read(p2WillpowerProvider.notifier).remove(value);
        break;
      case CellSelection.p3will:
        ref.read(p3WillpowerProvider.notifier).remove(value);
        break;
      case CellSelection.p4will:
        ref.read(p4WillpowerProvider.notifier).remove(value);
        break;
      default:
        break;
    }
  }
}