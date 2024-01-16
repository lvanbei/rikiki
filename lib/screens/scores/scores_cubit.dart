import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/screens/base/base.dart';

import 'scores.dart';

class ScoresCubit extends Cubit<ScoresState> {
  final BaseCubit baseCubit;
  ScoresCubit({required this.baseCubit}) : super(ScoresInitialState());

  void onWidgetDidInit() {
    //sort list by point !
    final listOfPlayers = (baseCubit.state as BaseLoadedState).listOfPlayers;
    listOfPlayers.sort((a, b) => b.points.compareTo(a.points));
    emit(ScoresLoadedState(listOfPlayers: listOfPlayers));
  }
}
