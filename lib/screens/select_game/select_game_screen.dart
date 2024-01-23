import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../core/core.dart';
import '../base/base.dart';
import 'select_game.dart';

class SelectGameScreen extends StatelessWidget {
  const SelectGameScreen({super.key});

  static final f = DateFormat('dd/MM/yyyy hh:mm');

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
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: state.games.length,
                      itemBuilder: (context, index) {
                        int currentRound = getRound(
                            isMinus: true,
                            playersLen: state.games[index].players.length,
                            round: state.games[index].round);
                        return ListTile(
                            minVerticalPadding: 16,
                            title:
                                Text(f.format(state.games[index].creationDate)),
                            trailing:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(
                                  '${state.games[index].players.length} players'),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(currentRound == -1
                                  ? 'Finished'
                                  : 'Round : $currentRound'),
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
                              context
                                  .read<BaseCubit>()
                                  .selectExistingGame(index);
                              if (currentRound == -1) {
                                return Router.neglect(
                                    context,
                                    () => GoRouter.of(context)
                                        .go(AppRoutes.scores));
                              }
                              Router.neglect(
                                  context,
                                  () => GoRouter.of(context)
                                      .go(AppRoutes.addPlayers));
                            });
                      },
                    ),
                  ),
                ),
                MyButton(
                  title: 'New Game',
                  size: ButtonSizes.small,
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
