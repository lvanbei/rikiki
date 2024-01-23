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
    final int selectedGameIndex =
        (baseCubit.state as BaseLoadedState).selectedGameIndex;
    final List<PlayerModel> listOfPlayers =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].players;
    final int round =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].round;

    emit(CheckFoldsLoadedState(
      listOfPlayers: listOfPlayers,
      round: round,
    ));
  }

  void updateFold(int newFold) {
    final currentState = state as CheckFoldsLoadedState;

    // if (newFold != currentState.getPlayerFold) {
    currentState.setPlayerFold(newFold);
    emit(currentState.copyWith(listOfPlayers: currentState.listOfPlayers));
    // }
  }

  void nextTurn(context) async {
    final currentState = state as CheckFoldsLoadedState;
    final currentTurn = currentState.turn + 1;

    // turn +1
    if (currentTurn < currentState.listOfPlayers.length) {
      //currentState.setNextPlayerPoint();
      emit(currentState.copyWith(
        turn: currentTurn,
      ));
    }

    // round +1
    if (currentState.isLastPlayer) {
      for (var player in currentState.listOfPlayers) {
        player.points += player.point;
        player.point = 10;
      }
      baseCubit.updatePlayers(currentState.listOfPlayers.rotatedLeft(1));
      Router.neglect(context, () => GoRouter.of(context).go(AppRoutes.scores));
      return;
    }
  }

  void previousTurn() {
    final currentState = state as CheckFoldsLoadedState;
    if (currentState.turn > 0) {
      emit(currentState.copyWith(
        turn: currentState.turn - 1,
      ));
    }
  }
}
