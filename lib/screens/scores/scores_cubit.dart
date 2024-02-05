import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki/screens/base/base.dart';

import '../../core/core.dart';
import 'scores.dart';

class ScoresCubit extends Cubit<ScoresState> {
  final BaseCubit baseCubit;
  ScoresCubit({required this.baseCubit}) : super(ScoresInitialState());

  void onWidgetDidInit() {
    final int selectedGameIndex =
        (baseCubit.state as BaseLoadedState).selectedGameIndex;
    final List<PlayerModel> listOfPlayers = [
      ...(baseCubit.state as BaseLoadedState).games[selectedGameIndex].players
    ];
    final int round =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].round;

    listOfPlayers
        .sort((a, b) => (b.points + b.point).compareTo(a.points + a.point));
    emit(ScoresLoadedState(
      listOfPlayers: listOfPlayers,
      round: round + 1,
    ));
  }

  void sumPoint() {
    final currentState = state as ScoresLoadedState;
    for (var player in currentState.listOfPlayers) {
      player.points += player.point;
      player.point = 0;
    }
  }

  void nextRound() async {
    sumPoint();
    final currentState = state as ScoresLoadedState;
    await baseCubit.shiftPlayers();
    await baseCubit.updateRound(currentState.round);
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
