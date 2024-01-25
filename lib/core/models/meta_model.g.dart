// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaModel _$MetaModelFromJson(Map<String, dynamic> json) => MetaModel(
      version: json['version'] as String,
      updateDateTime:
          const DateTimeConverter().fromJson(json['updateDateTime'] as String?),
    );

Map<String, dynamic> _$MetaModelToJson(MetaModel instance) => <String, dynamic>{
      'version': instance.version,
      'updateDateTime':
          const DateTimeConverter().toJson(instance.updateDateTime),
    };
