// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      round: (json['round'] as num?)?.toInt() ?? 0,
      rounds: (json['rounds'] as num?)?.toInt() ?? 0,
      pointsPerFold: (json['pointsPerFold'] as num?)?.toInt(),
      creationDate: DateTime.parse(json['creationDate'] as String),
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'round': instance.round,
      'rounds': instance.rounds,
      'pointsPerFold': instance.pointsPerFold,
      'creationDate': instance.creationDate.toIso8601String(),
      'players': instance.players,
    };
