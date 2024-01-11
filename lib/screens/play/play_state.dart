import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';

part 'play_state.g.dart';

abstract class PlayState {
  const PlayState();
}

class PlayInitialState extends PlayState {}

@CopyWith()
class PlayLoadedState extends PlayState {
  List<PlayerModel> listOfPlayers;
  final SharedPreferences prefs;

  PlayLoadedState({
    required this.listOfPlayers,
    required this.prefs,
  });
}
