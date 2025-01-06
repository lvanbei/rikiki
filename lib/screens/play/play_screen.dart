import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_view/gif_view.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../base/base_cubit.dart';
import 'play.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayCubit(context.read<BaseCubit>())..onWidgetDidInit(),
      child: BlocBuilder<PlayCubit, PlayState>(
        builder: (context, state) {
          if (state is PlayLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(child: SizedBox.shrink()),
                GifView.asset(
                  context
                      .read<PlayCubit>()
                      .getRandomGif(isBattle: state.isBattle),
                  height: 300,
                  width: 300,
                  progress: const LoadingScreen(),
                ),
                const Text(
                  "Play !",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                Text(
                  state.playText,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.bold),
                ),
                const Expanded(child: SizedBox.shrink()),
                MyButton(
                  title: 'Check folds',
                  size: ButtonSizes.medium,
                  onPressed: () {
                    Router.neglect(context,
                        () => GoRouter.of(context).go(AppRoutes.checkFolds));
                  },
                )
              ],
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
