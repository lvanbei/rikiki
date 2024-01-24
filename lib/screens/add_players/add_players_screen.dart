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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!state.continueGame)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: MyTextField(
                      state: state,
                      onSubmit: context.read<AddPlayersCubit>().onSubmitPlayer,
                      validator:
                          context.read<AddPlayersCubit>().playerNameValidator,
                    ),
                  ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      child: SizedBox(
                          child: ListView.builder(
                        itemCount: state.listOfPlayers.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(state.listOfPlayers[index].name),
                          leading: Text('${(index + 1)}.'),
                          trailing: state.continueGame
                              ? null
                              : IconButton(
                                  onPressed: () {
                                    context
                                        .read<AddPlayersCubit>()
                                        .onDeletePlayer(index);
                                  },
                                  icon: const Icon(Icons.delete_forever)),
                        ),
                      ))),
                ),
                MyButton(
                  title: state.continueGame ? 'continue' : 'next',
                  onPressed: state.enoughPlayer
                      ? () {
                          if (!state.continueGame) {
                            context.read<BaseCubit>().updateRound(0);
                            context.read<AddPlayersCubit>().updateFoldList();
                          }
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
