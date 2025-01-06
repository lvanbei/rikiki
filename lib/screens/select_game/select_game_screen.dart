import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
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
                Label(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    text: "Previous game${state.games.length > 1 ? "s" : ""}"),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: state.games.length,
                      itemBuilder: (context, index) {
                        int currentRound = getRound(
                            isMinus: true,
                            rounds: state.games[index].rounds,
                            round: state.games[index].round);
                        return ListTile(
                            minVerticalPadding: 16,
                            title: Text(state.games[index].name ?? "No name"),
                            trailing:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Text(displayFormat
                                  .format(state.games[index].creationDate)),
                              const Gap(16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(currentRound == -1
                                      ? 'Finished'
                                      : 'Round : $currentRound'),
                                  Text(
                                      '${state.games[index].players.length} players'),
                                ],
                              ),
                              const Gap(16),
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
