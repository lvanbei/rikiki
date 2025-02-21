// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameModel _$GameModelFromJson(Map<String, dynamic> json) => GameModel(
      round: (json['round'] as num?)?.toInt() ?? 0,
      rounds: (json['rounds'] as num?)?.toInt() ?? 0,
      pointsPerFold: (json['pointsPerFold'] as num?)?.toInt() ?? 2,
      increasePointPerFold: json['increasePointPerFold'] as bool? ?? false,
      creationDate: DateTime.parse(json['creationDate'] as String),
      players: (json['players'] as List<dynamic>)
          .map((e) => PlayerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$GameModelToJson(GameModel instance) => <String, dynamic>{
      'round': instance.round,
      'rounds': instance.rounds,
      'pointsPerFold': instance.pointsPerFold,
      'increasePointPerFold': instance.increasePointPerFold,
      'creationDate': instance.creationDate.toIso8601String(),
      'name': instance.name,
      'players': instance.players,
    };
