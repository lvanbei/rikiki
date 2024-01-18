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
  final int selectedUser;
  const ScoresLoadedState({
    required this.listOfPlayers,
    required this.round,
    this.selectedUser = 0,
  });
}
