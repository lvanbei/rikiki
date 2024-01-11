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
                const Text("Check folds",
                    style:
                        TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
                Column(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 70,
                        child: AnimatedTextKit(
                          key: Key(state.turn.toString()),
                          animatedTexts: [
                            RotateAnimatedText(
                                state.listOfPlayers[state.turn].name,
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
                    Text(
                      'Did ${state.playerFold} folds ?',
                      style: const TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (MediaQuery.of(context).size.width > 672)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                              title: 'Yes',
                              size: ButtonSizes.big,
                              onPressed: () {
                                context
                                    .read<CheckFoldsCubit>()
                                    .checkFolds(true, context);
                              }),
                          const SizedBox(
                            width: 16,
                          ),
                          MyButton(
                              title: 'No',
                              size: ButtonSizes.big,
                              onPressed: () {
                                context
                                    .read<CheckFoldsCubit>()
                                    .checkFolds(false, context);
                              })
                        ],
                      ),
                    if (MediaQuery.of(context).size.width <= 672)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyButton(
                              title: 'Yes',
                              size: ButtonSizes.big,
                              onPressed: () {
                                context
                                    .read<CheckFoldsCubit>()
                                    .checkFolds(true, context);
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          MyButton(
                              title: 'No',
                              size: ButtonSizes.big,
                              onPressed: () {
                                context
                                    .read<CheckFoldsCubit>()
                                    .checkFolds(false, context);
                              })
                        ],
                      ),
                  ],
                ),
                const SizedBox()
              ],
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
