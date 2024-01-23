import 'package:copy_with_extension/copy_with_extension.dart';

import '../../core/models/game_model.dart';

part 'select_game_state.g.dart';

abstract class SelectGameState {
  const SelectGameState();
}

class SelectGameInitialState extends SelectGameState {}

@CopyWith()
class SelectGameLoadedState extends SelectGameState {
  final List<GameModel> games;

  SelectGameLoadedState({
    required this.games,
  });
}
