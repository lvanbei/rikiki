import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki/screens/base/base.dart';

import '../../core/core.dart';
import 'check_folds_state.dart';

class CheckFoldsCubit extends Cubit<CheckFoldsState> {
  final BaseCubit baseCubit;
  CheckFoldsCubit({required this.baseCubit}) : super(CheckFoldsInitialState());

  void onWidgetDidInit() {
    final int selectedGameIndex =
        (baseCubit.state as BaseLoadedState).selectedGameIndex;
    final List<PlayerModel> listOfPlayers = [
      ...(baseCubit.state as BaseLoadedState).games[selectedGameIndex].players
    ];
    final int round =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].round;
    final int rounds =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].rounds;

    final int pointPerFold = (baseCubit.state as BaseLoadedState)
        .games[selectedGameIndex]
        .pointsPerFold;
    final bool increasePointPerFold = (baseCubit.state as BaseLoadedState)
        .games[selectedGameIndex]
        .increasePointPerFold;
    //reset made folds
    for (var player in listOfPlayers) {
      player.folds[round].makedFolds = 0;
    }

    emit(CheckFoldsLoadedState(
      listOfPlayers: listOfPlayers,
      round: round,
      rounds: rounds,
      displayedFold: listOfPlayers[0].folds[round].announcedFolds,
      pointPerFold: pointPerFold,
      increasePointPerFold: increasePointPerFold,
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as CheckFoldsLoadedState;
    final rounds = currentState.rounds;

    final isRoundGreaterThanNine =
        getRound(rounds: rounds, round: currentState.round) > 9;
    final isPlayerFoldOne = currentState.playerMakedFold == 1;

    int foldValue =
        isRoundGreaterThanNine && isPlayerFoldOne ? 10 + newFold : newFold;

    emit(currentState.copyWith(displayedFold: foldValue));
  }

  void nextTurn(context) async {
    final currentState = state as CheckFoldsLoadedState;
    final currentTurn = currentState.turn + 1;

    currentState.setPlayerFold(currentState.displayedFold);
    // turn +1
    if (currentTurn < currentState.listOfPlayers.length) {
      emit(currentState.copyWith(
        turn: currentTurn,
        displayedFold: currentState.getPlayerFoldWithIndex(currentTurn),
      ));
    }

    // round +1
    if (currentState.isLastPlayer) {
      baseCubit.updatePlayers(currentState.listOfPlayers);
      Router.neglect(context, () => GoRouter.of(context).go(AppRoutes.scores));
      return;
    }
  }

  void previousTurn() {
    final currentState = state as CheckFoldsLoadedState;
    if (currentState.turn > 0) {
      //set incoming player point back to null
      currentState.setPlayerFold(0, currentState.turn - 1);
      //set leaving player point back to null
      currentState.setPlayerFold(0);
      emit(currentState.copyWith(
        turn: currentState.turn - 1,
        displayedFold:
            currentState.getPlayerFoldWithIndex(currentState.turn - 1),
      ));
    }
  }
}
