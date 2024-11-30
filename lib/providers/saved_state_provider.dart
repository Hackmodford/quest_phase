import 'dart:convert';
import 'dart:math';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:quest_phase/models/saved_state.dart';
import 'package:quest_phase/providers/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_state_provider.g.dart';

enum PlayerOption { p1, p2, p3, p4 }

const int lowerLimit = 0;
const int upperLimit = 9999;
const String savedStateKey = 'savedState';
const String debounceKey = 'savedStateDebounceKey';

@Riverpod(keepAlive: true)
class SavedStateNotifier extends _$SavedStateNotifier {
  @override
  SavedState build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final jsonString = prefs.getString(savedStateKey);
    SavedState savedState;
    if (jsonString == null || jsonString.isEmpty) {
      savedState = SavedState.empty();
    } else {
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      savedState = SavedState.fromJson(json);
    }

    listenSelf((previous, next) {
      // save game state when changes stop after .333 seconds
      EasyDebounce.debounce(
        debounceKey,
        const Duration(milliseconds: 333),
        () {
          final map = next.toJson();
          final jsonString = jsonEncode(map);
          prefs.setString(savedStateKey, jsonString);
        },
      );
    });

    return savedState;
  }

  void reset() {
    state = state.copyWith(
      numberOfPlayers: 0,
      round: 1,
      stagingThreat: 0,
      playerState1: const PlayerState(
        willpower: 0,
        threat: 0,
      ),
      playerState2: const PlayerState(
        willpower: 0,
        threat: 0,
      ),
      playerState3: const PlayerState(
        willpower: 0,
        threat: 0,
      ),
      playerState4: const PlayerState(
        willpower: 0,
        threat: 0,
      ),
    );
  }

  void setOnePlayer() {
    state = state.copyWith(numberOfPlayers: 1);
  }

  void setTwoPlayer() {
    state = state.copyWith(numberOfPlayers: 2);
  }

  void setThreePlayer() {
    state = state.copyWith(numberOfPlayers: 3);
  }

  void setFourPlayer() {
    state = state.copyWith(numberOfPlayers: 4);
  }

  void setRound(int value) {
    state = state.copyWith(round: value.clamp(lowerLimit, upperLimit));
  }

  void addRound(int value) {
    state = state.copyWith(round: min(state.round + value, upperLimit));
  }

  void removeRound(int value) {
    state = state.copyWith(round: max(state.round - value, lowerLimit));
  }

  void setStagingThreat(int value) {
    state = state.copyWith(stagingThreat: value.clamp(lowerLimit, upperLimit));
  }

  void addStagingThreat(int value) {
    state = state.copyWith(
      stagingThreat: min(state.stagingThreat + value, upperLimit),
    );
  }

  void removeStagingThreat(int value) {
    state = state.copyWith(
      stagingThreat: max(state.stagingThreat - value, lowerLimit),
    );
  }

  void setPlayerWillpower(PlayerOption player, int value) {
    final clampedValue = value.clamp(lowerLimit, upperLimit);
    switch (player) {
      case PlayerOption.p1:
        state = state.copyWith.playerState1(
          willpower: clampedValue,
        );
      case PlayerOption.p2:
        state = state.copyWith.playerState2(
          willpower: clampedValue,
        );
      case PlayerOption.p3:
        state = state.copyWith.playerState3(
          willpower: clampedValue,
        );
      case PlayerOption.p4:
        state = state.copyWith.playerState4(
          willpower: clampedValue,
        );
    }
  }

  void addPlayerWillpower(PlayerOption player, int value) {
    switch (player) {
      case PlayerOption.p1:
        state = state.copyWith.playerState1(
          willpower: min(state.playerState1.willpower + value, upperLimit),
        );
      case PlayerOption.p2:
        state = state.copyWith.playerState2(
          willpower: min(state.playerState2.willpower + value, upperLimit),
        );
      case PlayerOption.p3:
        state = state.copyWith.playerState3(
          willpower: min(state.playerState3.willpower + value, upperLimit),
        );
      case PlayerOption.p4:
        state = state.copyWith.playerState4(
          willpower: min(state.playerState4.willpower + value, upperLimit),
        );
    }
  }

  void removePlayerWillpower(PlayerOption player, int value) {
    switch (player) {
      case PlayerOption.p1:
        state = state.copyWith.playerState1(
          willpower: max(state.playerState1.willpower - value, lowerLimit),
        );
      case PlayerOption.p2:
        state = state.copyWith.playerState2(
          willpower: max(state.playerState2.willpower - value, lowerLimit),
        );
      case PlayerOption.p3:
        state = state.copyWith.playerState3(
          willpower: max(state.playerState3.willpower - value, lowerLimit),
        );
      case PlayerOption.p4:
        state = state.copyWith.playerState4(
          willpower: max(state.playerState4.willpower - value, lowerLimit),
        );
    }
  }

  void setPlayerThreat(PlayerOption player, int value) {
    final clampedValue = value.clamp(lowerLimit, upperLimit);
    switch (player) {
      case PlayerOption.p1:
        state = state.copyWith.playerState1(threat: clampedValue);
      case PlayerOption.p2:
        state = state.copyWith.playerState2(threat: clampedValue);
      case PlayerOption.p3:
        state = state.copyWith.playerState3(threat: clampedValue);
      case PlayerOption.p4:
        state = state.copyWith.playerState4(threat: clampedValue);
    }
  }

  void addPlayerThreat(PlayerOption player, int value) {
    switch (player) {
      case PlayerOption.p1:
        state = state.copyWith.playerState1(
          threat: min(state.playerState1.threat + value, upperLimit),
        );
      case PlayerOption.p2:
        state = state.copyWith.playerState2(
          threat: min(state.playerState2.threat + value, upperLimit),
        );
      case PlayerOption.p3:
        state = state.copyWith.playerState3(
          threat: min(state.playerState3.threat + value, upperLimit),
        );
      case PlayerOption.p4:
        state = state.copyWith.playerState4(
          threat: min(state.playerState4.threat + value, upperLimit),
        );
    }
  }

  void removePlayerThreat(PlayerOption player, int value) {
    switch (player) {
      case PlayerOption.p1:
        state = state.copyWith.playerState1(
          threat: max(state.playerState1.threat - value, lowerLimit),
        );
      case PlayerOption.p2:
        state = state.copyWith.playerState2(
          threat: max(state.playerState2.threat - value, lowerLimit),
        );
      case PlayerOption.p3:
        state = state.copyWith.playerState3(
          threat: max(state.playerState3.threat - value, lowerLimit),
        );
      case PlayerOption.p4:
        state = state.copyWith.playerState4(
          threat: max(state.playerState4.threat - value, lowerLimit),
        );
    }
  }
}
