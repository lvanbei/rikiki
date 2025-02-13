import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki/screens/screens.dart';

import '../../core/core.dart';

class SetFoldsScreen extends StatelessWidget {
  const SetFoldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SetFoldsCubit(baseCubit: context.read<BaseCubit>())
        ..onWidgetDidInit(),
      child: BlocBuilder<SetFoldsCubit, SetFoldsState>(
        builder: (context, state) {
          if (state is SetFoldsLoadedState) {
            final currentRound =
                getRound(rounds: state.rounds, round: state.round);
            final totalAnnouncedFold = state.totalAnnouncedFold;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Round $currentRound',
                        style: const TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold)),
                    Text(
                        '$totalAnnouncedFold fold${totalAnnouncedFold > 1 ? 's' : ''} announced',
                        style: const TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold)),
                  ],
                ),
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
                        state.displayedFold.toString(),
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
                  mainAxisAlignment: MediaQuery.of(context).size.width > 672
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  enableZero: 0 <= currentRound && state.isFoldAllowed(0),
                  enableOne: 1 <= currentRound && state.isFoldAllowed(1),
                  enableTwo: 2 <= currentRound && state.isFoldAllowed(2),
                  enableThree: 3 <= currentRound && state.isFoldAllowed(3),
                  enableFor: 4 <= currentRound && state.isFoldAllowed(4),
                  enableFive: 5 <= currentRound && state.isFoldAllowed(5),
                  enableSix: 6 <= currentRound && state.isFoldAllowed(6),
                  enableSeven: 7 <= currentRound && state.isFoldAllowed(7),
                  enableEight: 8 <= currentRound && state.isFoldAllowed(8),
                  enableNine: 9 <= currentRound && state.isFoldAllowed(9),
                  textStyle: const TextStyle(color: AppColors.white),
                  onKeyboardTap: (text) =>
                      context.read<SetFoldsCubit>().updateFold(int.parse(text)),
                  rightIcon: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () =>
                        context.read<SetFoldsCubit>().nextTurn(context),
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.check,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  leftIcon: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: state.turn > 0
                        ? () => context.read<SetFoldsCubit>().previousTurn()
                        : null,
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
