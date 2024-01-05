import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameInitialState());

  void onWidgetDidInit() async {
    //add fallback in case no users
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final players = prefs.getString("players");
    emit(GameLoadedState(
      listOfPlayers: players != null
          ? (jsonDecode(players) as List)
              .map((e) => PlayerModel.fromJson(e))
              .toList()
          : [],
      prefs: prefs,
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as GameLoadedState;
    if (newFold <= currentState.round && newFold != currentState.fold) {
      emit(currentState.copyWith(fold: newFold));
    }
  }

  void updateTurn() {
    final currentState = state as GameLoadedState;
    if (currentState.turn < currentState.listOfPlayers.length - 1) {
      emit(currentState.copyWith(turn: currentState.turn + 1));
    }
  }
}
