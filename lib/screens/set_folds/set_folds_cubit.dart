import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki/core/core.dart';
import 'package:rikiki/screens/base/base.dart';

import 'set_folds_state.dart';

class SetFoldsCubit extends Cubit<SetFoldsState> {
  final BaseCubit baseCubit;
  SetFoldsCubit({required this.baseCubit}) : super(SetFoldsInitialState());

  void onWidgetDidInit() {
    final baseState = (baseCubit.state as BaseLoadedState);
    final int selectedGameIndex = baseState.selectedGameIndex;
    final List<PlayerModel> listOfPlayers = [
      ...baseState.games[selectedGameIndex].players
    ];
    final round = baseState.games[selectedGameIndex].round;
    final rounds = baseState.games[selectedGameIndex].rounds;

    emit(SetFoldsLoadedState(
      listOfPlayers: listOfPlayers,
      round: round,
      rounds: rounds,
      displayedFold: listOfPlayers.first.folds[round].announcedFolds,
      announcedFoldTotal: _getTotalAnnouncedFolds(listOfPlayers, round),
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as SetFoldsLoadedState;
    final currentPlayerFold = currentState.displayedFold;

    if (newFold != currentPlayerFold) {
      final isRoundGreaterThanNine =
          getRound(rounds: currentState.rounds, round: currentState.round) > 9;

      final isPlayerFoldOne = currentPlayerFold == 1;
      int foldValue =
          isRoundGreaterThanNine && isPlayerFoldOne ? 10 + newFold : newFold;

      currentState.announcedFoldTotal[currentState.turn] = foldValue;

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
          !currentState.isLastPlayerFoldAllowed(0)) {
        currentState.setPlayerWithIndexFold(0, nextTurn);
        currentState.announcedFoldTotal[nextTurn] = 1;
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
      currentState.announcedFoldTotal[currentState.turn] = 0;
      emit(currentState.copyWith(
        turn: currentState.turn - 1,
        displayedFold:
            currentState.getPlayerFoldWithIndex(currentState.turn - 1),
      ));
    }
  }

  List<int> _getTotalAnnouncedFolds(
      List<PlayerModel> listOfPlayers, int round) {
    List<int> folds = [];
    for (PlayerModel player in listOfPlayers) {
      folds.add(player.folds[round].announcedFolds);
    }
    return folds;
  }
}
