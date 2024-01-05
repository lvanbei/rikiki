import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:rikiki_for_real/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final int fold;
  final int turn;

  GameLoadedState({
    required this.listOfPlayers,
    required this.prefs,
    this.round = 1,
    this.fold = 0,
    this.turn = 0,
  });
}
