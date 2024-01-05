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

    if (newFold != currentState.getPlayerFold) {
      if (currentState.isLastPlayer) {
        currentState.setPlayerFold(newFold);
        emit(currentState);
        return;
      }
      final newFoldTotal =
          currentState.foldTotal - currentState.getPlayerFold + newFold;
      currentState.setPlayerFold(newFold);
      emit(currentState.copyWith(foldTotal: newFoldTotal));
    }
  }

  void nextTurn() {
    final currentState = state as GameLoadedState;
    final currentTurn = currentState.turn + 1;
    // turn +1
    if (currentTurn < currentState.listOfPlayers.length) {
      if (currentTurn == currentState.listOfPlayers.length - 1 &&
          currentState.lastPlayerNotAllowedFold == 0) {
        currentState.setPlayerFold(1);
        emit(currentState.copyWith(turn: currentTurn));
        return;
      }
      emit(currentState.copyWith(turn: currentTurn));
    }

    // round +1
    // turn 0
    if (currentState.isLastPlayer && currentState.isRoundUp) {
      emit(currentState.copyWith(
          listOfPlayers: currentState.listOfPlayers.rotatedLeft(1),
          turn: 0,
          foldTotal: 0,
          gameStep: GameStep.play,
          round: currentState.round + 1,
          roundDirection: RoundDirection.up));
    }

    // round -1
    // turn 0
    if (currentState.isLastPlayer && !currentState.isRoundUp) {
      emit(currentState.copyWith(
          turn: 0,
          foldTotal: 0,
          round: currentState.round,
          roundDirection: RoundDirection.down));
    }
  }

  void previousTurn() {
    final currentState = state as GameLoadedState;
    if (currentState.turn > 0) {
      if (currentState.isLastPlayer) {
        emit(currentState.copyWith(
          turn: currentState.turn - 1,
        ));

        currentState.setPlayerFold(0);
        return;
      }
      print('minus : ${currentState.getPlayerFold}');
      emit(currentState.copyWith(
          turn: currentState.turn - 1,
          foldTotal: currentState.foldTotal - currentState.getPlayerFold));
      currentState.setPlayerFold(0);
    }
  }
}
