import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toolbar_controller.g.dart';

@riverpod
ToolbarController toolbarController(ToolbarControllerRef ref) =>
    ToolbarController(ref);

class ToolbarController {
  ToolbarController(this.ref);

  final Ref ref;

  void onRemoveOneThreatFromAllPlayers() {
    ref
        .read(savedStateNotifierProvider.notifier)
        .removePlayerThreat(PlayerOption.p1, 1);
    ref
        .read(savedStateNotifierProvider.notifier)
        .removePlayerThreat(PlayerOption.p2, 1);
    ref
        .read(savedStateNotifierProvider.notifier)
        .removePlayerThreat(PlayerOption.p3, 1);
    ref
        .read(savedStateNotifierProvider.notifier)
        .removePlayerThreat(PlayerOption.p4, 1);
  }

  void onAddOneThreatToAllPlayers() {
    ref
        .read(savedStateNotifierProvider.notifier)
        .addPlayerThreat(PlayerOption.p1, 1);
    ref
        .read(savedStateNotifierProvider.notifier)
        .addPlayerThreat(PlayerOption.p2, 1);
    ref
        .read(savedStateNotifierProvider.notifier)
        .addPlayerThreat(PlayerOption.p3, 1);
    ref
        .read(savedStateNotifierProvider.notifier)
        .addPlayerThreat(PlayerOption.p4, 1);
  }

  void _onResetStagingThreat() {
    ref.read(savedStateNotifierProvider.notifier).setStagingThreat(0);
  }

  void _onResetAllPlayerWillpower() {
    ref
        .read(savedStateNotifierProvider.notifier)
        .setPlayerWillpower(PlayerOption.p1, 0);
    ref
        .read(savedStateNotifierProvider.notifier)
        .setPlayerWillpower(PlayerOption.p2, 0);
    ref
        .read(savedStateNotifierProvider.notifier)
        .setPlayerWillpower(PlayerOption.p3, 0);
    ref
        .read(savedStateNotifierProvider.notifier)
        .setPlayerWillpower(PlayerOption.p4, 0);
  }

  void onClearAll() {
    _onResetStagingThreat();
    _onResetAllPlayerWillpower();
  }

  void onRemoveOne() {
    _onRemove(1);
  }

  void onAddOne() {
    _onAdd(1);
  }

  void onAddTwo() {
    _onAdd(2);
  }

  void onAddFive() {
    _onAdd(5);
  }

  void onRefreshAndNewRound() {
    ref.read(savedStateNotifierProvider.notifier).addRound(1);
    onAddOneThreatToAllPlayers();
    _onResetAllPlayerWillpower();

    if (ref.read(shouldResetStagingThreatProvider)) {
      _onResetStagingThreat();
    }
  }

  void _onAdd(int value) {
    final selection = ref.read(selectedCellProvider);
    switch (selection) {
      case CellSelection.stagingThreat:
        ref.read(savedStateNotifierProvider.notifier).addStagingThreat(value);
      case CellSelection.p1will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .addPlayerWillpower(PlayerOption.p1, value);
      case CellSelection.p2will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .addPlayerWillpower(PlayerOption.p2, value);
      case CellSelection.p3will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .addPlayerWillpower(PlayerOption.p3, value);
      case CellSelection.p4will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .addPlayerWillpower(PlayerOption.p4, value);
      case CellSelection.round:
        break;
      case CellSelection.p1threat:
        break;
      case CellSelection.p2threat:
        break;
      case CellSelection.p3threat:
        break;
      case CellSelection.p4threat:
        break;
    }
  }

  void _onRemove(int value) {
    final selection = ref.read(selectedCellProvider);
    switch (selection) {
      case CellSelection.stagingThreat:
        ref
            .read(savedStateNotifierProvider.notifier)
            .removeStagingThreat(value);
      case CellSelection.p1will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .removePlayerWillpower(PlayerOption.p1, value);
      case CellSelection.p2will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .removePlayerWillpower(PlayerOption.p2, value);
      case CellSelection.p3will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .removePlayerWillpower(PlayerOption.p3, value);
      case CellSelection.p4will:
        ref
            .read(savedStateNotifierProvider.notifier)
            .removePlayerWillpower(PlayerOption.p4, value);
      case CellSelection.round:
        break;
      case CellSelection.p1threat:
        break;
      case CellSelection.p2threat:
        break;
      case CellSelection.p3threat:
        break;
      case CellSelection.p4threat:
        break;
    }
  }
}
