import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  final String name;
  List<FoldsModel> folds;
  int points;
  int point;

  PlayerModel({
    required this.name,
    required this.folds,
    this.points = 0,
    this.point = 0,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}

@JsonSerializable()
class FoldsModel {
  int round;
  int announcedFolds;
  int makedFolds;

  FoldsModel({
    this.announcedFolds = 0,
    this.round = 0,
    this.makedFolds = 0,
  });

  factory FoldsModel.fromJson(Map<String, dynamic> json) =>
      _$FoldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoldsModelToJson(this);
}
