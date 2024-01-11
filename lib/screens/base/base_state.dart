import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/core.dart';

part 'base_state.g.dart';

abstract class BaseState {
  const BaseState();
}

class BaseInitialState extends BaseState {}

@CopyWith()
class BaseLoadedState extends BaseState {
  final SharedPreferences prefs;
  final List<PlayerModel> initialListOfPlayers;
  final List<PlayerModel> listOfPlayers;
  final int round;

  BaseLoadedState({
    required this.prefs,
    required this.initialListOfPlayers,
    this.listOfPlayers = const [],
    this.round = 0,
  });
}
