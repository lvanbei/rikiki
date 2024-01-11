import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/core/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';
import 'base.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitialState());

  void onWidgetDidInit() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final players = prefs.getString("players");
    final List<PlayerModel> parsedPlayers =
        players != null ? _parsePlayers(players, prefs) : [];
    final game = prefs.getString("game");
    final GameModel parsedGame =
        game != null ? _parseGame(game, prefs) : const GameModel();

    emit(BaseLoadedState(
      prefs: prefs,
      initialListOfPlayers: parsedPlayers,
      listOfPlayers: parsedPlayers,
      round: parsedGame.round,
    ));
  }

  List<PlayerModel> _parsePlayers(players, SharedPreferences prefs) {
    try {
      return (jsonDecode(players) as List)
          .map((e) => PlayerModel.fromJson(e))
          .toList();
    } catch (e) {
      prefs.setString('players', '');
      return [];
    }
  }

  GameModel _parseGame(game, SharedPreferences prefs) {
    try {
      return (GameModel.fromJson(jsonDecode(game)));
    } catch (e) {
      prefs.setString('game', '');
      return const GameModel();
    }
  }

  Future updatePlayers(List<PlayerModel> players) async {
    final currentState = state as BaseLoadedState;
    emit(currentState.copyWith(listOfPlayers: players));
    await currentState.prefs.setString(
        "players", jsonEncode(players.map((e) => e.toJson()).toList()));
  }

  Future updateRound(int round) async {
    final currentState = state as BaseLoadedState;
    emit(currentState.copyWith(round: round));
    await currentState.prefs
        .setString("game", jsonEncode(GameModel(round: round).toJson()));
  }
}
