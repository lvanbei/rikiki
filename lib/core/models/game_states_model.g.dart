// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_states_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameStatesModel _$GameStatesModelFromJson(Map<String, dynamic> json) =>
    GameStatesModel(
      games: (json['games'] as List<dynamic>)
          .map((e) => GameModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedGameIndex: (json['selectedGameIndex'] as num?)?.toInt(),
    );

Map<String, dynamic> _$GameStatesModelToJson(GameStatesModel instance) =>
    <String, dynamic>{
      'selectedGameIndex': instance.selectedGameIndex,
      'games': instance.games,
    };
