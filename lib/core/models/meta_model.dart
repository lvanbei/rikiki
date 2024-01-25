import 'package:json_annotation/json_annotation.dart';

import '../core.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel {
  final String version;
  @DateTimeConverter()
  final DateTime? updateDateTime;

  const MetaModel({
    required this.version,
    required this.updateDateTime,
  });
  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
