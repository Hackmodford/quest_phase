import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/round_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:quest_phase/providers/staging_threat_provider.dart';
import 'package:quest_phase/providers/threat_player_providers.dart';
import 'package:quest_phase/providers/willpower_player_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'number_pad_controller.g.dart';

@riverpod
NumberPadController numberPadController(NumberPadControllerRef ref) => NumberPadController(ref);

class NumberPadController {
  final Ref _ref;

  NumberPadController(this._ref);

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
    switch (_ref.read(selectedCellProvider)) {
      case CellSelection.stagingThreat:
        return _ref.read(stagingThreatProvider);
      case CellSelection.p1will:
        return _ref.read(p1WillpowerProvider);
      case CellSelection.p2will:
        return _ref.read(p2WillpowerProvider);
      case CellSelection.p3will:
        return _ref.read(p3WillpowerProvider);
      case CellSelection.p4will:
        return _ref.read(p4WillpowerProvider);
      case CellSelection.round:
        return _ref.read(roundProvider);
      case CellSelection.p1threat:
        return _ref.read(p1ThreatProvider);
      case CellSelection.p2threat:
        return _ref.read(p2ThreatProvider);
      case CellSelection.p3threat:
        return _ref.read(p3ThreatProvider);
      case CellSelection.p4threat:
        return _ref.read(p4ThreatProvider);
    }
  }

  void _setCellValue(int value) {
    switch (_ref.read(selectedCellProvider)) {
      case CellSelection.stagingThreat:
        _ref.read(stagingThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p1will:
        _ref.read(p1WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.p2will:
        _ref.read(p2WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.p3will:
        _ref.read(p3WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.p4will:
        _ref.read(p4WillpowerProvider.notifier).setValue(value);
        break;
      case CellSelection.round:
        _ref.read(roundProvider.notifier).setValue(value);
        break;
      case CellSelection.p1threat:
        _ref.read(p1ThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p2threat:
        _ref.read(p2ThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p3threat:
        _ref.read(p3ThreatProvider.notifier).setValue(value);
        break;
      case CellSelection.p4threat:
        _ref.read(p4ThreatProvider.notifier).setValue(value);
        break;
    }
  }
}
