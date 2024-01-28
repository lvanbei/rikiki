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
      displayedFold: listOfPlayers[0].folds[round].announcedFolds,
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as SetFoldsLoadedState;
    final currentPlayerFold = currentState.displayedFold;

    if (newFold != currentPlayerFold) {
      final isRoundGreaterThanNine = getRound(
              playersLen: currentState.listOfPlayers.length,
              round: currentState.round) >
          9;

      final isPlayerFoldOne = currentPlayerFold == 1;
      int foldValue =
          isRoundGreaterThanNine && isPlayerFoldOne ? 10 + newFold : newFold;

      emit(currentState.copyWith(displayedFold: foldValue));
    }
  }

  void nextTurn(context) {
    final currentState = state as SetFoldsLoadedState;
    final nextTurn = currentState.turn + 1;

    // turn +1
    currentState.setPlayerFold(currentState.displayedFold);
    if (nextTurn < currentState.listOfPlayers.length) {
      if (nextTurn == currentState.listOfPlayers.length - 1 &&
          currentState.isFoldAllowed(0)) {
        currentState.setPlayerWithIndexFold(0, nextTurn);
        emit(
          currentState.copyWith(
            turn: nextTurn,
            displayedFold: 1,
          ),
        );
        return;
      }
      emit(currentState.copyWith(
        turn: nextTurn,
        displayedFold: currentState.getPlayerFoldWithIndex(nextTurn),
      ));
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
      //reset player fold
      currentState.setPlayerFold(0);
      emit(currentState.copyWith(
        turn: currentState.turn - 1,
        displayedFold:
            currentState.getPlayerFoldWithIndex(currentState.turn - 1),
      ));
    }
  }
}
