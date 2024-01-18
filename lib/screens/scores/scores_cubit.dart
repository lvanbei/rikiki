import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/screens/base/base.dart';

import 'scores.dart';

class ScoresCubit extends Cubit<ScoresState> {
  final BaseCubit baseCubit;
  ScoresCubit({required this.baseCubit}) : super(ScoresInitialState());

  void onWidgetDidInit() {
    //sort list by point !
    final listOfPlayers = (baseCubit.state as BaseLoadedState).listOfPlayers;
    final int round = (baseCubit.state as BaseLoadedState).round;
    listOfPlayers.sort((a, b) => b.points.compareTo(a.points));
    emit(ScoresLoadedState(
      listOfPlayers: listOfPlayers,
      round: round,
    ));
  }

  void updatePlayer({bool isLeft = true}) {
    final currentState = state as ScoresLoadedState;
    final currentUser = currentState.selectedUser;
    int nextUser;

    if (isLeft) {
      nextUser = (currentUser + 1) % currentState.listOfPlayers.length;
    } else {
      nextUser = (currentUser - 1 + currentState.listOfPlayers.length) %
          currentState.listOfPlayers.length;
    }

    emit(currentState.copyWith(selectedUser: nextUser));
  }
}
