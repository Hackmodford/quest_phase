import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/selected_cell_Provider.dart';

enum ToolbarMode { none, playerThreat, willAndThreat, round }

final toolbarModeProvider =
    StateNotifierProvider<ToolbarModeNotifier, ToolbarMode>(
        (ref) => ToolbarModeNotifier(ref));

class ToolbarModeNotifier extends StateNotifier<ToolbarMode> {
  Ref ref;

  ToolbarModeNotifier(this.ref) : super(ToolbarMode.none) {
    final cellSelection = ref.read(selectedCellProvider);
    _setWithCellSelection(cellSelection);
    ref.listen(selectedCellProvider, (previous, next) {
      _setWithCellSelection(next);
    });
  }

  void _setWithCellSelection(CellSelection cellSelection) {
    switch (cellSelection) {
      case CellSelection.p1will:
      case CellSelection.p2will:
      case CellSelection.p3will:
      case CellSelection.p4will:
      case CellSelection.threat:
        set(ToolbarMode.willAndThreat);
        break;
      case CellSelection.round:
        set(ToolbarMode.round);
        break;
      case CellSelection.p1threat:
      case CellSelection.p2threat:
      case CellSelection.p3threat:
      case CellSelection.p4threat:
        set(ToolbarMode.playerThreat);
        break;
    }
  }

  void set(ToolbarMode mode) {
    state = mode;
  }
}
