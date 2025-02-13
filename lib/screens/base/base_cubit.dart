import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gif_view/gif_view.dart';
import 'package:rikiki/core/constants/gif_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import 'base.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitialState());

  void onWidgetDidInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final game = prefs.getString("games");
    final GameStatesModel parsedGame = _parseGame(game, prefs);
    final metaString = await rootBundle.loadString('assets/meta.json');
    await _prefFetchGifs();
    emit(BaseLoadedState(
      meta: MetaModel.fromJson(jsonDecode(metaString)),
      prefs: prefs,
      games: parsedGame.games,
      selectedGameIndex:
          parsedGame.selectedGameIndex ?? parsedGame.games.length - 1,
    ));
    FlutterNativeSplash.remove();
  }

  Future<void> _prefFetchGifs() async {
    for (String battleGif in battleGifList) {
      await GifView.preFetchImage(AssetImage("assets/gifs/$battleGif.gif"));
    }
    for (String lessGif in lessGifList) {
      await GifView.preFetchImage(AssetImage("assets/gifs/$lessGif.gif"));
    }
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

  Future updatePlayers(List<PlayerModel> players) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].players = players;
    await updateGames();
  }

  Future shiftPlayers() async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].players = currentState
        .games[currentState.selectedGameIndex].players
        .rotatedLeft(1);
    await updateGames();
  }

  Future updateRounds(int rounds) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].rounds = rounds;
    await updateGames();
  }

  Future updateRound(int round) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].round = round;
    await updateGames();
  }

  Future updatePointPerFold(int pointsPerFold) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].pointsPerFold =
        pointsPerFold;
    await updateGames();
  }

  Future updateGameName(String? gameName) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].name = gameName;
    await updateGames();
  }

  Future updateIncreasePointPerFold(bool increasePointPerFold) async {
    final currentState = state as BaseLoadedState;
    currentState.games[currentState.selectedGameIndex].increasePointPerFold =
        increasePointPerFold;
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
