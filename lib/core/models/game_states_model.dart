import 'package:json_annotation/json_annotation.dart';
import 'package:rikiki/core/core.dart';

part 'game_states_model.g.dart';

@JsonSerializable()
class GameStatesModel {
  final int? selectedGameIndex;
  final List<GameModel> games;

  GameStatesModel({
    required this.games,
    this.selectedGameIndex,
  });
  factory GameStatesModel.fromJson(Map<String, dynamic> json) =>
      _$GameStatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$GameStatesModelToJson(this);
}
