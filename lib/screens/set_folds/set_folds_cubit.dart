import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki_for_real/core/core.dart';
import 'package:rikiki_for_real/screens/base/base.dart';

import 'set_folds_state.dart';

class SetFoldsCubit extends Cubit<SetFoldsState> {
  final BaseCubit baseCubit;
  SetFoldsCubit({required this.baseCubit}) : super(SetFoldsInitialState());

  void onWidgetDidInit() {
    final baseState = (baseCubit.state as BaseLoadedState);
    final int selectedGameIndex = baseState.selectedGameIndex;
    final List<PlayerModel> listOfPlayers =
        baseState.games[selectedGameIndex].players;
    final round = baseState.games[selectedGameIndex].round;

    emit(SetFoldsLoadedState(
      listOfPlayers: listOfPlayers,
      round: round,
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as SetFoldsLoadedState;
    final currentPlayerFold = currentState.getPlayerFold;

    if (newFold != currentPlayerFold) {
      final isRoundGreaterThanNine = getRound(
              playersLen: currentState.listOfPlayers.length,
              round: currentState.round) >
          9;

      final isPlayerFoldOne = currentPlayerFold == 1;
      int foldValue =
          isRoundGreaterThanNine && isPlayerFoldOne ? 10 + newFold : newFold;

      if (currentState.isLastPlayer) {
        currentState.setPlayerFold(foldValue);
        emit(currentState.copyWith(listOfPlayers: currentState.listOfPlayers));
      } else {
        final newFoldTotal =
            currentState.foldTotal - currentPlayerFold + foldValue;
        currentState.setPlayerFold(foldValue);
        emit(currentState.copyWith(foldTotal: newFoldTotal));
      }
    }
  }

  void nextTurn(context) {
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

    if (currentState.isLastPlayer) {
      baseCubit.updatePlayers(currentState.listOfPlayers);
      Router.neglect(context, () => GoRouter.of(context).go(AppRoutes.play));
      return;
    }
  }

  void previousTurn() {
    final currentState = state as SetFoldsLoadedState;
    if (currentState.turn > 0) {
      if (currentState.isLastPlayer) {
        emit(currentState.copyWith(
          turn: currentState.turn - 1,
        ));
        currentState.setPlayerFold(0);
        return;
      }
      emit(currentState.copyWith(
          turn: currentState.turn - 1,
          foldTotal: currentState.foldTotal - currentState.getPlayerFold));
      currentState.setPlayerFold(0);
    }
  }
}
