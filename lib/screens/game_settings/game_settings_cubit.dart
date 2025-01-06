import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../base/base.dart';
import 'game_settings_state.dart';

class GameSettingsCubit extends Cubit<GameSettingsState> {
  final BaseCubit baseCubit;

  GameSettingsCubit(this.baseCubit) : super(GameSettingsInitialState());
  void onWidgetDidInit() {
    final int selectedGameIndex =
        (baseCubit.state as BaseLoadedState).selectedGameIndex;
    final listOfPlayers =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].players;
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
    emit(GameSettingsLoadedState(
      listOfPlayers: listOfPlayers,
      rounds: (rounds / 2).ceil(),
      pointsPerFold: pointPerFold,
      increasePointPerFold: increasePointPerFold,
      round: round,
    ));
  }

  void plusPoint() {
    updatePointsPerFold(isPlus: true);
  }

  void minPoint() {
    updatePointsPerFold(isPlus: false);
  }

  void updatePointsPerFold({bool isPlus = false}) {
    final currentState = state as GameSettingsLoadedState;
    final currentPointPerFold = currentState.pointsPerFold;
    int newPoint = currentPointPerFold;
    if (isPlus) {
      newPoint += 1;
      baseCubit.updatePointPerFold(newPoint);
      return emit(currentState.copyWith(pointsPerFold: newPoint));
    }
    emit(currentState.copyWith(pointsPerFold: currentPointPerFold - 1));
    baseCubit.updatePointPerFold(newPoint);
  }

  void updateIncreasePointPerFold(bool status) {
    final currentState = state as GameSettingsLoadedState;
    emit(currentState.copyWith(increasePointPerFold: status));
    baseCubit.updateIncreasePointPerFold(status);
  }

  void plusRounds() {
    final currentState = state as GameSettingsLoadedState;
    emit(currentState.copyWith(
      rounds: currentState.rounds + 1,
    ));
    baseCubit.updateRounds(((currentState.rounds + 1) * 2) - 1);
  }

  void minRounds() {
    final currentState = state as GameSettingsLoadedState;
    emit(currentState.copyWith(
      rounds: currentState.rounds - 1,
    ));
    baseCubit.updateRounds(((currentState.rounds - 1) * 2) - 1);
  }

  void updatePlayerFoldList() {
    final currentState = state as GameSettingsLoadedState;
    final currentPlayers = currentState.listOfPlayers;

    for (var player in currentPlayers) {
      player.point = 0;
      player.folds = List.generate((currentState.rounds * 2) - 1, (int index) {
        if (player.folds.isNotEmpty &&
            index < player.folds.length &&
            player.folds[index].announcedFolds != 0 &&
            player.folds[index].makedFolds != 0) {
          return FoldsModel(
            announcedFolds: player.folds[index].announcedFolds,
            makedFolds: player.folds[index].makedFolds,
          );
        }
        return FoldsModel();
      });
    }

    baseCubit.updatePlayers(currentPlayers);
  }
}
