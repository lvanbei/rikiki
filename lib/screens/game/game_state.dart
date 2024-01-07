import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';

part 'game_state.g.dart';

abstract class GameState {
  const GameState();
}

class GameInitialState extends GameState {}

@CopyWith()
class GameLoadedState extends GameState {
  List<PlayerModel> listOfPlayers;
  final SharedPreferences prefs;

  final int round;
  final int foldTotal;
  final int turn;
  final RoundDirection roundDirection;
  final GameStep gameStep;

  GameLoadedState({
    required this.listOfPlayers,
    required this.prefs,
    this.round = 0,
    this.foldTotal = 0,
    this.turn = 0,
    this.roundDirection = RoundDirection.up,
    this.gameStep = GameStep.setFold,
  });

  int get maxFold => round + 1;

  bool get longName => listOfPlayers[turn].name.length > 12;

  void setPlayerFold(fold) => listOfPlayers[turn].folds[round].fold = fold;
  void setPlayerWithIndexFold(fold, index) =>
      listOfPlayers[index].folds[round].fold = fold;

  int get getPlayerFold => listOfPlayers[turn].folds[round].fold;

  bool get isLastPlayer => turn == listOfPlayers.length - 1;

  int get lastPlayerNotAllowedFold => maxFold - foldTotal;

  bool get isRoundUp =>
      round < (52 / listOfPlayers.length).floor() &&
      roundDirection == RoundDirection.up;

  bool get test {
    if (0 <= maxFold) {
      if (isLastPlayer && 0 == lastPlayerNotAllowedFold) {
        return false;
      }
      return true;
    }
    return false;
  }
}
