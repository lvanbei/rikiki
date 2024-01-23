import 'package:json_annotation/json_annotation.dart';
import 'package:rikiki_for_real/core/core.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  int round;
  final DateTime creationDate;
  List<PlayerModel> players;

  GameModel({
    this.round = 0,
    required this.creationDate,
    required this.players,
  });
  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
