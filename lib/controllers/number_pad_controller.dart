import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/threat_total_provider.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';

class NumberPadController {
  final Ref ref;

  NumberPadController(this.ref);

  void onClear() {
    _setCellValue(0);
  }

  void onBackspace() {
    var stringValue = _getCellValue().toString();
    if (stringValue.length == 1) {
      stringValue = '0';
    } else {
      stringValue = stringValue.substring(0, stringValue.length - 1);
    }
    final intValue = int.parse(stringValue);
    _setCellValue(intValue);
  }

  void onNumber(int value) {
    final stringValue = _getCellValue().toString() + value.toString();
    final intValue = int.parse(stringValue);
    _setCellValue(intValue);
  }

  int _getCellValue() {
    switch (ref.read(selectedCellProvider)) {
      case CellSelection.stagingThreat:
        return ref.read(stagingThreatProvider);
      case CellSelection.p1will:
        return ref.read(p1WillpowerProvider);
      case CellSelection.p2will:
        return ref.read(p2WillpowerProvider);
      case CellSelection.p3will:
        return ref.read(p3WillpowerProvider);
      case CellSelection.p4will:
        return ref.read(p4WillpowerProvider);
      case CellSelection.round:
        return ref.read(roundProvider);
      case CellSelection.p1threat:
        return ref.read(p1ThreatProvider);
      case CellSelection.p2threat:
        return ref.read(p2ThreatProvider);
      case CellSelection.p3threat:
        return ref.read(p3ThreatProvider);
      case CellSelection.p4threat:
        return ref.read(p4ThreatProvider);
    }
  }

  void _setCellValue(int value) {
    switch (ref.read(selectedCellProvider)) {
      case CellSelection.stagingThreat:
        ref.read(stagingThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p1will:
        ref.read(p1WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.p2will:
        ref.read(p2WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.p3will:
        ref.read(p3WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.p4will:
        ref.read(p4WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.round:
        ref.read(roundProvider.notifier).setValue(value);
        break;
      case CellSelection.p1threat:
        ref.read(p1ThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p2threat:
        ref.read(p2ThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p3threat:
        ref.read(p3ThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p4threat:
        ref.read(p4ThreatProvider.notifier).setValue(value);
        break;
    }
  }
}
