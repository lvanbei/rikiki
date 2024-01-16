import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki_for_real/screens/base/base.dart';

import '../../core/core.dart';
import 'check_folds_state.dart';

class CheckFoldsCubit extends Cubit<CheckFoldsState> {
  final BaseCubit baseCubit;
  CheckFoldsCubit({required this.baseCubit}) : super(CheckFoldsInitialState());

  void onWidgetDidInit() {
    emit(CheckFoldsLoadedState(
      listOfPlayers: (baseCubit.state as BaseLoadedState).listOfPlayers,
      round: (baseCubit.state as BaseLoadedState).round,
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as CheckFoldsLoadedState;

    // if (newFold != currentState.getPlayerFold) {
    currentState.setPlayerFold(newFold);
    emit(currentState.copyWith(listOfPlayers: currentState.listOfPlayers));
    // }
  }

  void nextTurn(context) {
    final currentState = state as CheckFoldsLoadedState;
    final currentTurn = currentState.turn + 1;

    // turn +1
    currentState.setPlayerPoint();
    if (currentTurn < currentState.listOfPlayers.length) {
      emit(currentState.copyWith(turn: currentTurn));
    }

    // round +1
    if (currentState.isLastPlayer) {
      baseCubit.updatePlayers(currentState.listOfPlayers.rotatedLeft(1));
      baseCubit.updateRound(currentState.round + 1);
      Router.neglect(
          context, () => GoRouter.of(context).go(AppRoutes.setFolds));
      return;
    }
  }

  void previousTurn() {
    final currentState = state as CheckFoldsLoadedState;
    if (currentState.turn > 0) {
      currentState.removPlayerPoint();
      emit(currentState.copyWith(
        turn: currentState.turn - 1,
      ));
    }
  }
}
