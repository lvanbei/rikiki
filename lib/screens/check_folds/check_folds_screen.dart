import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikiki_for_real/screens/screens.dart';

import '../../core/core.dart';

class CheckFoldsScreen extends StatelessWidget {
  const CheckFoldsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckFoldsCubit(baseCubit: context.read<BaseCubit>())
        ..onWidgetDidInit(),
      child: BlocBuilder<CheckFoldsCubit, CheckFoldsState>(
        builder: (context, state) {
          if (state is CheckFoldsLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Round ${state.round + 1}',
                    style: const TextStyle(
                        fontSize: 45, fontWeight: FontWeight.bold)),
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
                    // Expanded(flex: 4, child: Container()),
                    Text(
                      'did ${state.getPlayerFold.toString()} folds ?',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ],
                ),
                NumericKeyboard(
                  mainAxisAlignment: MediaQuery.of(context).size.width > 672
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceEvenly,
                  enableZero: 0 <= state.maxFold,
                  enableOne: 1 <= state.maxFold,
                  enableTwo: 2 <= state.maxFold,
                  enableThree: 3 <= state.maxFold,
                  enableFor: 4 <= state.maxFold,
                  enableFive: 5 <= state.maxFold,
                  enableSix: 6 <= state.maxFold,
                  enableSeven: 7 <= state.maxFold,
                  enableEight: 8 <= state.maxFold,
                  enableNine: 9 <= state.maxFold,
                  textStyle: const TextStyle(color: AppColors.white),
                  onKeyboardTap: (text) => context
                      .read<CheckFoldsCubit>()
                      .updateFold(int.parse(text)),
                  rightIcon: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () =>
                        context.read<CheckFoldsCubit>().nextTurn(context),
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.check,
                      ),
                    ),
                  ),
                  leftIcon: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: state.turn > 0
                        ? () => context.read<CheckFoldsCubit>().previousTurn()
                        : null,
                    child: Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
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
