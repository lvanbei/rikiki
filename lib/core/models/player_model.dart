import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  final String name;
  const PlayerModel({required this.name});

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}
