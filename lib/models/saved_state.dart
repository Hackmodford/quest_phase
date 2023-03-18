import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_state.freezed.dart';

part 'saved_state.g.dart';

@freezed
class SavedState with _$SavedState {
  const factory SavedState({
    required int numberOfPlayers,
    required int round,
    required int stagingThreat,
    required PlayerState playerState1,
    required PlayerState playerState2,
    required PlayerState playerState3,
    required PlayerState playerState4,
  }) = _SavedState;

  factory SavedState.fromJson(Map<String, dynamic> json) =>
      _$SavedStateFromJson(json);
}

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required int threat,
    required int willpower,
  }) = _PlayerState;

  factory PlayerState.fromJson(Map<String, dynamic> json) =>
      _$PlayerStateFromJson(json);
}
