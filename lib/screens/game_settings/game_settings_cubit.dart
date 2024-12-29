import 'package:flutter_bloc/flutter_bloc.dart';

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

    final int? pointPerFold = (baseCubit.state as BaseLoadedState)
        .games[selectedGameIndex]
        .pointsPerFold;

    emit(GameSettingsLoadedState(
      listOfPlayers: listOfPlayers,
      rounds: (rounds / 2).ceil(),
      pointsPerFold: pointPerFold ?? 2,
      increasePointPerFold: pointPerFold == null,
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
      return emit(currentState.copyWith(pointsPerFold: newPoint));
    }
    emit(currentState.copyWith(pointsPerFold: currentPointPerFold - 1));
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

  void updateIncreasePointPerFold(bool status) {
    final currentState = state as GameSettingsLoadedState;
    emit(currentState.copyWith(increasePointPerFold: status));
    baseCubit.updatePointPerFold(status ? null : currentState.pointsPerFold);
  }
}
