import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/screens/game/game_screens/game_play_screen.dart';

import '../../core/core.dart';
import 'game.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameCubit()..onWidgetDidInit(),
      child: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          if (state is GameLoadedState) {
            switch (state.gameStep) {
              case GameStep.setFold:
                return GameSetFoldScreen(
                  state: state,
                );
              case GameStep.play:
                return GamePlayScreen(
                  state: state,
                );
              default:
                return Container();
            }
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
