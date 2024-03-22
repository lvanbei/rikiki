import 'package:copy_with_extension/copy_with_extension.dart';

import '../../core/core.dart';

part 'scores_state.g.dart';

abstract class ScoresState {
  const ScoresState();
}

class ScoresInitialState extends ScoresState {}

@CopyWith()
class ScoresLoadedState extends ScoresState {
  final List<PlayerModel> listOfPlayers;
  final int round;
  final int rounds;
  final int selectedUser;
  const ScoresLoadedState({
    required this.listOfPlayers,
    required this.round,
    required this.rounds,
    this.selectedUser = 0,
  });

  int get points =>
      listOfPlayers[selectedUser].points + listOfPlayers[selectedUser].point;
  int pointsWithIndex(int index) =>
      listOfPlayers[index].points + listOfPlayers[index].point;

  int get announcedFoldTotal => listOfPlayers[selectedUser].folds.fold(
      0, (previousValue, element) => previousValue + element.announcedFolds);

  int get makedFoldTotal => listOfPlayers[selectedUser]
      .folds
      .fold(0, (previousValue, element) => previousValue + element.makedFolds);
}
