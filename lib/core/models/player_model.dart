import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  final String name;
  final List<FoldsModel> folds;

  const PlayerModel({required this.name, required this.folds});

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}

@JsonSerializable()
class FoldsModel {
  int round;
  int fold;

  FoldsModel({this.fold = 0, this.round = 0});

  factory FoldsModel.fromJson(Map<String, dynamic> json) =>
      _$FoldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoldsModelToJson(this);
}
