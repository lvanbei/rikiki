import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../base/base.dart';
import 'select_game.dart';

class SelectGameScreen extends StatelessWidget {
  const SelectGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SelectGameCubit(baseCubit: context.read<BaseCubit>())
        ..onWidgetDidInit(),
      child: BlocBuilder<SelectGameCubit, SelectGameState>(
        builder: (context, state) {
          if (state is SelectGameLoadedState) {
            return Column(
              children: [
                ...state.games.mapIndexed(
                  (index, e) => ListTile(
                      title: Text(e.creationDate.toString()),
                      trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text('round : ${(e.round + 1).toString()}'),
                        const SizedBox(
                          width: 16,
                        ),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<SelectGameCubit>()
                                  .removeGameByIndex(index);
                            },
                            icon: const Icon(Icons.delete_forever))
                      ]),
                      onTap: () {
                        context.read<BaseCubit>().selectExistingGame(index);
                        Router.neglect(
                            context,
                            () =>
                                GoRouter.of(context).go(AppRoutes.addPlayers));
                      }),
                ),
                MyButton(
                  title: 'New Game',
                  size: ButtonSizes.medium,
                  onPressed: () {
                    context.read<BaseCubit>().createNewGame();
                    Router.neglect(context,
                        () => GoRouter.of(context).go(AppRoutes.addPlayers));
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
