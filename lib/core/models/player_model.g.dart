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
    );

Map<String, dynamic> _$PlayerModelToJson(PlayerModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'folds': instance.folds,
    };

FoldsModel _$FoldsModelFromJson(Map<String, dynamic> json) => FoldsModel(
      fold: json['fold'] as int? ?? 0,
      round: json['round'] as int? ?? 0,
    );

Map<String, dynamic> _$FoldsModelToJson(FoldsModel instance) =>
    <String, dynamic>{
      'round': instance.round,
      'fold': instance.fold,
    };
