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

  GameLoadedState(
      {required this.listOfPlayers,
      required this.prefs,
      this.round = 1,
      this.foldTotal = 0,
      this.turn = 0,
      this.roundDirection = RoundDirection.up});

  int get maxFold => round;

  bool get longName => listOfPlayers[turn].name.length > 12;

  String get playerFold => listOfPlayers[turn].fold.toString();

  bool get isLastPlayer => turn == listOfPlayers.length - 1;

  int get lastPlayerNotAllowedFold {
    final res = round - foldTotal;
    print(res);
    return res;
  }

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
