import 'package:copy_with_extension/copy_with_extension.dart';

part 'base_state.g.dart';

abstract class BaseState {
  const BaseState();
}

class BaseInitialState extends BaseState {}

@CopyWith()
class BaseLoadedState extends BaseState {
  final bool isHome;

  const BaseLoadedState({this.isHome = true});
}
