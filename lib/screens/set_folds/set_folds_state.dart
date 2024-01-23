import 'package:copy_with_extension/copy_with_extension.dart';

import '../../core/core.dart';

part 'set_folds_state.g.dart';

abstract class SetFoldsState {
  const SetFoldsState();
}

class SetFoldsInitialState extends SetFoldsState {}

@CopyWith()
class SetFoldsLoadedState extends SetFoldsState {
  List<PlayerModel> listOfPlayers;

  final int round;
  final int foldTotal;
  final int turn;

  SetFoldsLoadedState({
    required this.listOfPlayers,
    required this.round,
    this.foldTotal = 0,
    this.turn = 0,
  });

  int get maxFold => getRound(playersLen: listOfPlayers.length, round: round);

  bool get longName => listOfPlayers[turn].name.length > 12;

  void setPlayerFold(int fold) {
    listOfPlayers[turn].folds[round].announcedFolds = fold;
    listOfPlayers[turn].folds[round].makedFolds = fold;
    listOfPlayers[turn].point = 10 + (fold * 2);
  }

  void setPlayerWithIndexFold(int fold, int index) {
    listOfPlayers[index].folds[round].announcedFolds = fold;
    listOfPlayers[index].folds[round].makedFolds = fold;
    listOfPlayers[index].point = 10 + (fold * 2);
  }

  int get getPlayerFold => listOfPlayers[turn].folds[round].announcedFolds;

  bool get isLastPlayer => turn == listOfPlayers.length - 1;

  int get lastPlayerNotAllowedFold => maxFold - foldTotal;
}
