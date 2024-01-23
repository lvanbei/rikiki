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

  int get playerAnnouncedFold =>
      listOfPlayers[turn].folds[round].announcedFolds;

  bool get isLastPlayer => turn == listOfPlayers.length - 1;

  int get playerMakedFold => listOfPlayers[turn].folds[round].makedFolds;

  void setPlayerFold(int fold) {
    listOfPlayers[turn].folds[round].makedFolds = fold;
    setPlayerPoint();
  }

  void setPlayerPoint() {
    final bool isCheck = (playerMakedFold - playerAnnouncedFold) == 0;
    if (isCheck) {
      print('plus : ${10 + (playerMakedFold * 2)}');
      listOfPlayers[turn].point = 10 + (playerMakedFold * 2);
    } else {
      print('minus : ${((playerAnnouncedFold - playerMakedFold).abs()) * 2}');
      listOfPlayers[turn].point =
          ((playerAnnouncedFold - playerMakedFold).abs()) * -2;
    }

    print('${listOfPlayers[turn].name} did ${listOfPlayers[turn].point} folds');
  }
}
