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

  int get playerFold => listOfPlayers[turn].folds[round].fold;

  bool get isLastPlayer => turn == listOfPlayers.length - 1;

  void setPlayerCheckFold(bool check) {
    listOfPlayers[turn].folds[round].isCheck = check;
  }
}
