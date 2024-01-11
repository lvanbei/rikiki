import 'package:json_annotation/json_annotation.dart';

part 'player_model.g.dart';

@JsonSerializable()
class PlayerModel {
  final String name;
  List<FoldsModel> folds;

  PlayerModel({required this.name, required this.folds});

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayerModelToJson(this);
}

@JsonSerializable()
class FoldsModel {
  int round;
  int fold;
  bool isCheck;

  FoldsModel({this.fold = 0, this.round = 0, this.isCheck = false});

  factory FoldsModel.fromJson(Map<String, dynamic> json) =>
      _$FoldsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoldsModelToJson(this);
}
