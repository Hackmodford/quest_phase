import 'package:hooks_riverpod/hooks_riverpod.dart';

enum CellSelection {
  threat,
  p1will,
  p2will,
  p3will,
  p4will,
  round,
  p1threat,
  p2threat,
  p3threat,
  p4threat,
}

final selectedCellProvider = StateNotifierProvider<SelectedCellNotifier, CellSelection>(
        (ref) => SelectedCellNotifier());

class SelectedCellNotifier extends StateNotifier<CellSelection> {
  SelectedCellNotifier() : super(CellSelection.threat);

  void set(CellSelection value) {
    state = value;
  }
}