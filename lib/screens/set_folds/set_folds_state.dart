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
  final int displayedFold;
  final int turn;

  SetFoldsLoadedState({
    required this.listOfPlayers,
    required this.round,
    required this.displayedFold,
    this.turn = 0,
  });

  int get maxFold => getRound(playersLen: listOfPlayers.length, round: round);

  bool get longName => listOfPlayers[turn].name.length > 12;

  void setPlayerFold(int fold) {
    listOfPlayers[turn].folds[round].announcedFolds = fold;
  }

  void setPlayerWithIndexFold(int fold, int index) {
    listOfPlayers[index].folds[round].announcedFolds = fold;
  }

  int get getPlayerFold => listOfPlayers[turn].folds[round].announcedFolds;

  int getPlayerFoldWithIndex(int index) =>
      listOfPlayers[index].folds[round].announcedFolds;

  bool get isLastPlayer => turn == listOfPlayers.length - 1;

  int get foldTotal => listOfPlayers.fold(
      0,
      (previousValue, element) =>
          previousValue + element.folds[round].announcedFolds);

  bool isFoldAllowed(int fold) {
    return !(isLastPlayer && fold == maxFold - foldTotal);
  }
}
