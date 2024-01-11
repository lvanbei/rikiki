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

  void checkFolds(bool isCheck, BuildContext context) {
    final currentState = state as CheckFoldsLoadedState;
    final int nextTurn = currentState.turn + 1;

    currentState.setPlayerCheckFold(isCheck);

    if (currentState.isLastPlayer) {
      baseCubit.updatePlayers(currentState.listOfPlayers);
      baseCubit.updateRound(currentState.round + 1);
      Router.neglect(
          context, () => GoRouter.of(context).go(AppRoutes.setFolds));
      return;
    }

    emit(currentState.copyWith(turn: nextTurn));
  }
}
