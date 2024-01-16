import 'package:copy_with_extension/copy_with_extension.dart';

import '../../core/core.dart';

part 'check_folds_state.g.dart';

abstract class CheckFoldsState {
  const CheckFoldsState();
}

class CheckFoldsInitialState extends CheckFoldsState {}

@CopyWith()
class CheckFoldsLoadedState extends CheckFoldsState {
  List<PlayerModel> listOfPlayers;
  final int round;
  final int turn;

  CheckFoldsLoadedState({
    required this.listOfPlayers,
    required this.round,
    this.turn = 0,
  });

  int get maxFold => round + 1;

  int get playerFold => listOfPlayers[turn].folds[round].announcedFolds;

  bool get isLastPlayer => turn == listOfPlayers.length - 1;

  int get getPlayerFold => listOfPlayers[turn].folds[round].makedFolds;

  void setPlayerFold(int fold) {
    listOfPlayers[turn].folds[round].makedFolds = fold;
  }

  void setPlayerPoint() {
    final makedFold = listOfPlayers[turn].folds[round].makedFolds;
    final announcedFold = listOfPlayers[turn].folds[round].announcedFolds;
    final bool isCheck = (makedFold - announcedFold) == 0;
    if (isCheck) {
      print('plus : ${10 + (makedFold * 2)}');
      listOfPlayers[turn].points += 10 + (maxFold * 2);
    } else {
      print('minus : ${((announcedFold - makedFold).abs()) * 2}');
      listOfPlayers[turn].points -= ((announcedFold - makedFold).abs()) * 2;
    }
  }

  void removPlayerPoint() {
    final makedFold = listOfPlayers[turn].folds[round].makedFolds;
    final announcedFold = listOfPlayers[turn].folds[round].announcedFolds;
    final bool isCheck = (makedFold - announcedFold) == 0;
    if (isCheck) {
      print('plus : ${10 + (makedFold * 2)}');
      listOfPlayers[turn].points -= 10 + (maxFold * 2);
    } else {
      print('minus : ${((announcedFold - makedFold).abs()) * 2}');
      listOfPlayers[turn].points += ((announcedFold - makedFold).abs()) * 2;
    }
  }
}
