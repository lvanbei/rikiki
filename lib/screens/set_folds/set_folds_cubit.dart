import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'set_folds_state.dart';

class SetFoldsCubit extends Cubit<SetFoldsState> {
  SetFoldsCubit() : super(SetFoldsInitialState());

  void onWidgetDidInit(
      SharedPreferences prefs, List<PlayerModel> players) async {
    emit(SetFoldsLoadedState(
      prefs: prefs,
      listOfPlayers: players,
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as SetFoldsLoadedState;

    if (newFold != currentState.getPlayerFold) {
      if (currentState.isLastPlayer) {
        currentState.setPlayerFold(newFold);
        emit(currentState.copyWith());
        return;
      }
      final newFoldTotal =
          currentState.foldTotal - currentState.getPlayerFold + newFold;
      currentState.setPlayerFold(newFold);
      emit(currentState.copyWith(foldTotal: newFoldTotal));
    }
  }

  void nextTurn() {
    final currentState = state as SetFoldsLoadedState;
    final currentTurn = currentState.turn + 1;
    // turn +1
    if (currentTurn < currentState.listOfPlayers.length) {
      if (currentTurn == currentState.listOfPlayers.length - 1 &&
          currentState.lastPlayerNotAllowedFold == 0) {
        currentState.setPlayerWithIndexFold(1, currentTurn);
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
          //play screen
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
    final currentState = state as SetFoldsLoadedState;
    if (currentState.turn > 0) {
      if (currentState.isLastPlayer) {
        emit(currentState.copyWith(
          turn: currentState.turn - 1,
        ));

        //currentState.setPlayerFold(0);
        return;
      }
      emit(currentState.copyWith(
          turn: currentState.turn - 1,
          foldTotal: currentState.foldTotal - currentState.getPlayerFold));
      currentState.setPlayerFold(0);
    }
  }
}
