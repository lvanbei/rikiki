import 'package:copy_with_extension/copy_with_extension.dart';

part 'play_state.g.dart';

abstract class PlayState {
  const PlayState();
}

class PlayInitialState extends PlayState {}

@CopyWith()
class PlayLoadedState extends PlayState {
  final int foldDelta;
  const PlayLoadedState({required this.foldDelta});

  bool get isBattle => foldDelta <= 0;
  String get playText => isBattle
      ? "${foldDelta.abs()} extra fold${foldDelta > 1 ? "s" : ""}"
      : "${foldDelta.abs()} fold${foldDelta > 1 ? "s" : ""} less";
}
