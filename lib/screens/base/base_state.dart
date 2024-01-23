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
  final List<GameModel> games;
  final int selectedGameIndex;

  BaseLoadedState({
    required this.prefs,
    required this.games,
    required this.selectedGameIndex,
  });
}
