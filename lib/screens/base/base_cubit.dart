import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import 'base.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitialState());

  void onWidgetDidInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final game = prefs.getString("games");
    final GameStatesModel parsedGame = _parseGame(game, prefs);
    final version = await rootBundle.loadString('assets/version.txt');
    emit(BaseLoadedState(
      version: int.parse(version),
      prefs: prefs,
      games: parsedGame.games,
      selectedGameIndex:
          parsedGame.selectedGameIndex ?? parsedGame.games.length - 1,
    ));
  }

  GameStatesModel _parseGame(String? game, SharedPreferences prefs) {
    try {
      if (game == null) {
        throw ("game is null");
      }
      return GameStatesModel.fromJson(jsonDecode(game));
    } catch (e) {
      prefs.setString('games', '');
      return GameStatesModel(games: []);
    }
  }

  Future updateGames() async {
    final currentState = state as BaseLoadedState;
    await currentState.prefs.setString(
        "games",
        jsonEncode(GameStatesModel(
            games: currentState.games,
            selectedGameIndex: currentState.selectedGameIndex)));
  }

  Future updateSelectedIndex(int index) async {
    final currentState = state as BaseLoadedState;
    currentState.copyWith(selectedGameIndex: index);
    updateGames();
  }

  Future updatePlayers(List<PlayerModel> players) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].players = players;
    await updateGames();
  }

  Future updateRound(int round) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].round = round;
    await updateGames();
  }

  void createNewGame() {
    final currentState = state as BaseLoadedState;
    final newGame = GameModel(creationDate: DateTime.now(), players: []);
    currentState.games.add(newGame);
    emit(currentState.copyWith(
        selectedGameIndex: currentState.games.length - 1));
    updateGames();
  }

  void selectExistingGame(int index) {
    final currentState = state as BaseLoadedState;
    emit(currentState.copyWith(selectedGameIndex: index));
    updateGames();
  }

  void removeGameByIndex(int index) {
    final currentState = state as BaseLoadedState;
    currentState.games.removeAt(index);
    emit(currentState.copyWith(selectedGameIndex: 0));
    updateGames();
  }
}
