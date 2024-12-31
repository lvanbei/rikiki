import 'package:json_annotation/json_annotation.dart';
import 'package:rikiki/core/models/player_model.dart';

part 'game_model.g.dart';

@JsonSerializable()
class GameModel {
  int round;
  int rounds;
  int pointsPerFold;
  bool increasePointPerFold;
  final DateTime creationDate;
  String? name;
  List<PlayerModel> players;

  GameModel({
    this.round = 0,
    this.rounds = 0,
    this.pointsPerFold = 2,
    this.increasePointPerFold = false,
    required this.creationDate,
    required this.players,
    this.name,
  });
  factory GameModel.fromJson(Map<String, dynamic> json) =>
      _$GameModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameModelToJson(this);
}
