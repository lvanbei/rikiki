import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/screens/game/game.dart';

import '../../../core/core.dart';

class GameSetFoldScreen extends StatelessWidget {
  final GameLoadedState state;
  const GameSetFoldScreen({
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Round ${state.round + 1}',
            style: const TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
        Center(
          child: SizedBox(
            height: 70,
            child: AnimatedTextKit(
              key: Key(state.turn.toString()),
              animatedTexts: [
                RotateAnimatedText(state.listOfPlayers[state.turn].name,
                    alignment: Alignment.topCenter,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 4, child: Container()),
            Expanded(
              flex: 2,
              child: Text(
                state.getPlayerFold.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 32),
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
          enableZero: 0 <= state.maxFold &&
              !(state.isLastPlayer && 0 == state.lastPlayerNotAllowedFold),
          enableOne: 1 <= state.maxFold &&
              !(state.isLastPlayer && 1 == state.lastPlayerNotAllowedFold),
          enableTwo: 2 <= state.maxFold &&
              !(state.isLastPlayer && 2 == state.lastPlayerNotAllowedFold),
          enableThree: 3 <= state.maxFold &&
              !(state.isLastPlayer && state.lastPlayerNotAllowedFold == 3),
          enableFor: 4 <= state.maxFold &&
              !(state.isLastPlayer && state.lastPlayerNotAllowedFold != 4),
          enableFive: 5 <= state.maxFold &&
              !(state.isLastPlayer && state.lastPlayerNotAllowedFold != 5),
          enableSix: 6 <= state.maxFold &&
              !(state.isLastPlayer && state.lastPlayerNotAllowedFold != 6),
          enableSeven: 7 <= state.maxFold &&
              !(state.isLastPlayer && state.lastPlayerNotAllowedFold != 7),
          enableEight: 8 <= state.maxFold &&
              !(state.isLastPlayer && state.lastPlayerNotAllowedFold != 8),
          enableNine: 9 <= state.maxFold &&
              !(state.isLastPlayer && state.lastPlayerNotAllowedFold != 9),
          textStyle: const TextStyle(color: AppColors.white),
          onKeyboardTap: (text) =>
              context.read<GameCubit>().updateFold(int.parse(text)),
          rightIcon: IconButton(
            onPressed: () => context.read<GameCubit>().nextTurn(),
            icon: const Icon(
              Icons.check,
            ),
          ),
          leftIcon: IconButton(
            onPressed: state.turn > 0
                ? () => context.read<GameCubit>().previousTurn()
                : null,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
