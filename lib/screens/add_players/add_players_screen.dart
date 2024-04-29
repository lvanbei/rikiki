import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../base/base.dart';
import 'add_players.dart';

class AddPlayersScreen extends StatelessWidget {
  const AddPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPlayersCubit(baseCubit: context.read<BaseCubit>())
        ..onWidgetDidInit(),
      child: BlocBuilder<AddPlayersCubit, AddPlayersState>(
        builder: (context, state) {
          if (state is AddPlayersLoadedState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Label(text: "Points per fold"),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!state.continueGame)
                        IconButton(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                            onPressed: !state.increasePointPerFold &&
                                    state.pointsPerFold > 1
                                ? () {
                                    context
                                        .read<AddPlayersCubit>()
                                        .updatePointsPerFold(isPlus: false);
                                  }
                                : null,
                            icon: const Icon(Icons.minimize)),
                      Text(
                        '${state.pointsPerFold}',
                        style: TextStyle(
                            fontSize: 24,
                            color: state.increasePointPerFold
                                ? AppColors.lightGrey
                                : null),
                      ),
                      if (!state.continueGame)
                        IconButton(
                          onPressed: !state.increasePointPerFold &&
                                  state.pointsPerFold < 10
                              ? () {
                                  context
                                      .read<AddPlayersCubit>()
                                      .updatePointsPerFold(
                                          isPlus: true, longPress: true);
                                }
                              : null,
                          icon: const Icon(Icons.add),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Divider(),
                ),
                const Label(
                  text: "The points are equal to the round",
                ),
                Switch(
                  trackOutlineColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (state.continueGame) {
                      return AppColors.grey;
                    }
                    return AppColors.black;
                  }),
                  thumbColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (state.continueGame) {
                      return AppColors.grey;
                    }
                    if (state.increasePointPerFold) {
                      return AppColors.white;
                    }
                    return AppColors.black;
                  }),
                  trackColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (state.increasePointPerFold) {
                      return AppColors.black;
                    }
                    return AppColors.white;
                  }),
                  value: state.increasePointPerFold,
                  onChanged: (bool status) {
                    if (!state.continueGame) {
                      context
                          .read<AddPlayersCubit>()
                          .updateIncreasePointPerFold(status);
                    }
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                const Divider(),
                const Label(text: "Add players"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: MyTextField(
                    state: state,
                    onSubmit: context.read<AddPlayersCubit>().onSubmitPlayer,
                    validator:
                        context.read<AddPlayersCubit>().playerNameValidator,
                  ),
                ),
                if (!state.enoughPlayer)
                  const Row(children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Add at least 3 players.",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    )
                  ]),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: SizedBox(
                          child: ListView.builder(
                        itemCount: state.displayedListOfPlayers.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(state.displayedListOfPlayers[index].name),
                          leading: Text('${(index + 1)}.'),
                          trailing: IconButton(
                              onPressed: () {
                                context.read<AddPlayersCubit>().onDeletePlayer(
                                    index,
                                    state.displayedListOfPlayers[index].name);
                              },
                              icon: const Icon(Icons.delete_forever)),
                        ),
                      ))),
                ),
                MyButton(
                  title: state.continueGame ? 'Continue' : 'Next',
                  onPressed: state.enoughPlayer
                      ? () {
                          context.read<AddPlayersCubit>().updateFoldList();
                          Router.neglect(
                              context,
                              () =>
                                  GoRouter.of(context).go(AppRoutes.setFolds));
                        }
                      : null,
                  size: ButtonSizes.small,
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

class Label extends StatelessWidget {
  const Label({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
