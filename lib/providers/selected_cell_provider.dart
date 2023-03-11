import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_cell_provider.g.dart';

enum CellSelection {
  stagingThreat,
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

@riverpod
class SelectedCell extends _$SelectedCell {
  @override
  CellSelection build() {
    return CellSelection.stagingThreat;
  }

  void set(CellSelection value) {
    state = value;
  }
}