// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedState _$$_SavedStateFromJson(Map<String, dynamic> json) =>
    _$_SavedState(
      numberOfPlayers: json['numberOfPlayers'] as int,
      round: json['round'] as int,
      stagingThreat: json['stagingThreat'] as int,
      playerState1:
          PlayerState.fromJson(json['playerState1'] as Map<String, dynamic>),
      playerState2:
          PlayerState.fromJson(json['playerState2'] as Map<String, dynamic>),
      playerState3:
          PlayerState.fromJson(json['playerState3'] as Map<String, dynamic>),
      playerState4:
          PlayerState.fromJson(json['playerState4'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SavedStateToJson(_$_SavedState instance) =>
    <String, dynamic>{
      'numberOfPlayers': instance.numberOfPlayers,
      'round': instance.round,
      'stagingThreat': instance.stagingThreat,
      'playerState1': instance.playerState1,
      'playerState2': instance.playerState2,
      'playerState3': instance.playerState3,
      'playerState4': instance.playerState4,
    };

_$_PlayerState _$$_PlayerStateFromJson(Map<String, dynamic> json) =>
    _$_PlayerState(
      threat: json['threat'] as int,
      willpower: json['willpower'] as int,
    );

Map<String, dynamic> _$$_PlayerStateToJson(_$_PlayerState instance) =>
    <String, dynamic>{
      'threat': instance.threat,
      'willpower': instance.willpower,
    };
