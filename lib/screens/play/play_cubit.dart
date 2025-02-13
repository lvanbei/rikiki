import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki/core/core.dart';

import '../../core/constants/gif_names.dart';
import '../base/base_cubit.dart';
import '../base/base_state.dart';
import 'play.dart';

class PlayCubit extends Cubit<PlayState> {
  final BaseCubit baseCubit;

  PlayCubit(this.baseCubit) : super(PlayInitialState());
  void onWidgetDidInit() {
    final int selectedGameIndex =
        (baseCubit.state as BaseLoadedState).selectedGameIndex;
    final listOfPlayers =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].players;
    final int round =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].round;
    final int rounds =
        (baseCubit.state as BaseLoadedState).games[selectedGameIndex].rounds;
    int totalAnnouncedFolds = 0;
    for (final player in listOfPlayers) {
      totalAnnouncedFolds += player.folds[round].announcedFolds;
    }
    emit(PlayLoadedState(
      foldDelta: (getRound(rounds: rounds, round: round)) - totalAnnouncedFolds,
      firstPlayerName: listOfPlayers.first.name,
    ));
  }

  String getRandomGif({bool isBattle = true}) {
    final randomGif = Random().nextInt(battleGifList.length);
    if (isBattle) {
      return "assets/gifs/${battleGifList[randomGif]}.gif";
    }
    return "assets/gifs/${lessGifList[randomGif]}.gif";
  }
}
