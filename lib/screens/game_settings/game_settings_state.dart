import 'package:copy_with_extension/copy_with_extension.dart';

import '../../core/core.dart';

part 'game_settings_state.g.dart';

abstract class GameSettingsState {
  const GameSettingsState();
}

class GameSettingsInitialState extends GameSettingsState {}

@CopyWith()
class GameSettingsLoadedState extends GameSettingsState {
  final int rounds;
  final List<PlayerModel> listOfPlayers;
  final int pointsPerFold;
  final bool increasePointPerFold;
  final int round;
  const GameSettingsLoadedState({
    required this.rounds,
    required this.listOfPlayers,
    required this.pointsPerFold,
    required this.increasePointPerFold,
    required this.round,
  });

  int get maxRounds =>
      listOfPlayers.isNotEmpty ? (52 / listOfPlayers.length).floor() : 0;
  bool get canAddRound => rounds < maxRounds;
  bool get canDeleteRound => rounds > 1;

  bool get continueGame => round > 0;
}
