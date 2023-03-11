import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'toolbar_state_provider.g.dart';

enum ToolbarModes { none, playerThreat, willAndThreat, round }

@riverpod
class ToolbarMode extends _$ToolbarMode {
  @override
  ToolbarModes build() {
    final initialValue = ref.watch(selectedCellProvider);
    final mode = _getModeForSelection(initialValue);
    return mode;
  }

  ToolbarModes _getModeForSelection(CellSelection cellSelection) {
    switch (cellSelection) {
      case CellSelection.p1will:
      case CellSelection.p2will:
      case CellSelection.p3will:
      case CellSelection.p4will:
      case CellSelection.stagingThreat:
        return ToolbarModes.willAndThreat;
      case CellSelection.round:
        return ToolbarModes.round;
      case CellSelection.p1threat:
      case CellSelection.p2threat:
      case CellSelection.p3threat:
      case CellSelection.p4threat:
        return ToolbarModes.playerThreat;
    }
  }

  void set(ToolbarModes mode) {
    state = mode;
  }
}
