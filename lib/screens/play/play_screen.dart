import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import 'play.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  //remove bloc?
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayCubit()..onWidgetDidInit(),
      child: BlocBuilder<PlayCubit, PlayState>(
        builder: (context, state) {
          if (state is PlayLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Center(
                    child: Text(
                      "Play !",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                MyButton(
                  title: 'Finished',
                  size: ButtonSizes.big,
                  onPressed: () {
                    Router.neglect(context,
                        () => GoRouter.of(context).go(AppRoutes.checkFolds));
                  },
                ),
                const SizedBox(),
              ],
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
