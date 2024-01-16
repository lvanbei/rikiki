// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) => PlayerModel(
      name: json['name'] as String,
      folds: (json['folds'] as List<dynamic>)
          .map((e) => FoldsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      points: json['points'] as int? ?? 0,
    );

Map<String, dynamic> _$PlayerModelToJson(PlayerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'folds': instance.folds,
      'points': instance.points,
    };

FoldsModel _$FoldsModelFromJson(Map<String, dynamic> json) => FoldsModel(
      announcedFolds: json['announcedFolds'] as int? ?? 0,
      round: json['round'] as int? ?? 0,
      makedFolds: json['makedFolds'] as int? ?? 0,
    );

Map<String, dynamic> _$FoldsModelToJson(FoldsModel instance) =>
    <String, dynamic>{
      'round': instance.round,
      'announcedFolds': instance.announcedFolds,
      'makedFolds': instance.makedFolds,
    };
