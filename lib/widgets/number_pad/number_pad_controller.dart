import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quest_phase/providers/saved_state_provider.dart';
import 'package:quest_phase/providers/selected_cell_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'number_pad_controller.g.dart';

@riverpod
NumberPadController numberPadController(NumberPadControllerRef ref) =>
    NumberPadController(ref);

class NumberPadController {

  NumberPadController(this._ref);
  final Ref _ref;

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
        return _ref.read(
          savedStateNotifierProvider.select((value) => value.stagingThreat),
        );
      case CellSelection.p1will:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState1.willpower),
        );
      case CellSelection.p2will:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState2.willpower),
        );
      case CellSelection.p3will:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState3.willpower),
        );
      case CellSelection.p4will:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState4.willpower),
        );
      case CellSelection.round:
        return _ref.read(
          savedStateNotifierProvider.select((value) => value.round),
        );
      case CellSelection.p1threat:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState1.threat),
        );
      case CellSelection.p2threat:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState2.threat),
        );
      case CellSelection.p3threat:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState3.threat),
        );
      case CellSelection.p4threat:
        return _ref.read(
          savedStateNotifierProvider
              .select((value) => value.playerState4.threat),
        );
    }
  }

  void _setCellValue(int value) {
    switch (_ref.read(selectedCellProvider)) {
      case CellSelection.stagingThreat:
        _ref.read(savedStateNotifierProvider.notifier).setStagingThreat(value);
        break;
      case CellSelection.p1will:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerWillpower(PlayerOption.p1, value);
        break;
      case CellSelection.p2will:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerWillpower(PlayerOption.p2, value);
        break;
      case CellSelection.p3will:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerWillpower(PlayerOption.p3, value);
        break;
      case CellSelection.p4will:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerWillpower(PlayerOption.p4, value);
        break;
      case CellSelection.round:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setRound(value);
        break;
      case CellSelection.p1threat:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerThreat(PlayerOption.p1, value);
        break;
      case CellSelection.p2threat:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerThreat(PlayerOption.p2, value);
        break;
      case CellSelection.p3threat:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerThreat(PlayerOption.p3, value);
        break;
      case CellSelection.p4threat:
        _ref
            .read(savedStateNotifierProvider.notifier)
            .setPlayerThreat(PlayerOption.p4, value);
        break;
    }
  }
}
