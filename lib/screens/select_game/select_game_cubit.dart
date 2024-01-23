import 'package:flutter_bloc/flutter_bloc.dart';

import '../base/base.dart';
import 'select_game.dart';

class SelectGameCubit extends Cubit<SelectGameState> {
  final BaseCubit baseCubit;
  SelectGameCubit({required this.baseCubit}) : super(SelectGameInitialState());

  void onWidgetDidInit() {
    final games = (baseCubit.state as BaseLoadedState).games;
    games.sort(
      (a, b) => b.creationDate.compareTo(a.creationDate),
    );
    emit(SelectGameLoadedState(
      games: (baseCubit.state as BaseLoadedState).games,
    ));
  }

  void removeGameByIndex(int index) {
    baseCubit.removeGameByIndex(index);
    final currentState = state as SelectGameLoadedState;
    emit(currentState.copyWith(games: currentState.games));
  }
}
