import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki/core/core.dart';

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
    final List<String> battleGifList = [
      "battle-1",
      "battle-2",
      "battle-3",
      "battle-4",
      "battle-5",
    ];
    final List<String> lessGifList = [
      "less-1",
      "less-2",
      "less-3",
      "less-4",
      "less-5",
    ];
    final randomGif = Random().nextInt(battleGifList.length);
    if (isBattle) {
      return "assets/gifs/${battleGifList[randomGif]}.gif";
    }
    return "assets/gifs/${lessGifList[randomGif]}.gif";
  }
}
