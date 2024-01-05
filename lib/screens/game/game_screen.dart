import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

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
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Round 1',
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 120,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex:
                                state.listOfPlayers[state.turn].name.length > 12
                                    ? 6
                                    : 5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: AnimatedTextKit(
                                key: Key(state.turn.toString()),
                                animatedTexts: [
                                  RotateAnimatedText(
                                      state.listOfPlayers[state.turn].name,
                                      textAlign: TextAlign.end,
                                      alignment: Alignment.centerRight,
                                      textStyle: const TextStyle(
                                        fontSize: 32,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      rotateOut: false,
                                      duration: const Duration(
                                        milliseconds: 500,
                                      )),
                                ],
                                totalRepeatCount: 1,
                                pause: const Duration(milliseconds: 0),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              ),
                            ),
                          ),
                          Expanded(
                            flex:
                                state.listOfPlayers[state.turn].name.length > 12
                                    ? 4
                                    : 5,
                            child: const Text(
                              ' it\'s your turn',
                              style: TextStyle(fontSize: 16, height: 8),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(flex: 4, child: Container()),
                      Expanded(
                        flex: 2,
                        child: Text(
                          state.fold.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 46),
                        ),
                      ),
                      const Expanded(
                        flex: 4,
                        child: Text(
                          'fold',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  NumericKeyboard(
                    onKeyboardTap: (text) =>
                        context.read<GameCubit>().updateFold(int.parse(text)),
                    rightIcon: IconButton(
                      onPressed: () => context.read<GameCubit>().updateTurn(),
                      icon: const Icon(
                        Icons.check,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
