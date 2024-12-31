import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../base/base.dart';
import 'add_players.dart';

class AddPlayersScreen extends StatelessWidget {
  const AddPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return BlocProvider(
      create: (_) => AddPlayersCubit(baseCubit: context.read<BaseCubit>())
        ..onWidgetDidInit(),
      child: BlocBuilder<AddPlayersCubit, AddPlayersState>(
        builder: (context, state) {
          if (state is AddPlayersLoadedState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Label(
                  text: "Game name",
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                      initialValue: state.gameName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged:
                          context.read<AddPlayersCubit>().onGameNameChange),
                ),
                const Gap(8),
                const Label(text: "Add players"),
                Padding(
                  padding: const EdgeInsets.all(8),
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
                    padding: const EdgeInsets.all(8),
                    child: Scrollbar(
                      controller: scrollController,
                      thumbVisibility: true,
                      child: ReorderableListView(
                        scrollController: scrollController,
                        // controller: scrollController,
                        // itemCount: state.displayedListOfPlayers.length,
                        onReorder: context
                            .read<AddPlayersCubit>()
                            .onReorderListOfPlayers,
                        // controller: scrollController,
                        // itemCount: state.displayedListOfPlayers.length,
                        children: <Widget>[
                          for (int index = 0;
                              index < state.displayedListOfPlayers.length;
                              index += 1)
                            ListTile(
                              key: Key('$index'),
                              title: Text(
                                  state.displayedListOfPlayers[index].name),
                              leading: Text('${(index + 1)}.'),
                              trailing: IconButton(
                                  onPressed: () {
                                    context
                                        .read<AddPlayersCubit>()
                                        .onDeletePlayer(
                                            index,
                                            state.displayedListOfPlayers[index]
                                                .name);
                                  },
                                  icon: const Icon(Icons.delete_forever)),
                            ),
                        ],
                        // itemBuilder: (context, index) =>
                        //
                        // ListTile(
                        //   title: Text(state.displayedListOfPlayers[index].name),
                        //   leading: Text('${(index + 1)}.'),
                        //   trailing: IconButton(
                        //       onPressed: () {
                        //         context.read<AddPlayersCubit>().onDeletePlayer(
                        //             index,
                        //             state.displayedListOfPlayers[index].name);
                        //       },
                        //       icon: const Icon(Icons.delete_forever)),
                        // ),
                      ),
                    ),
                  ),
                ),
                const Gap(8),
                MyButton(
                  title: state.continueGame ? 'Continue' : 'Next',
                  onPressed: state.enoughPlayer
                      ? () {
                          context.read<AddPlayersCubit>().updateFoldList();
                          Router.neglect(
                              context,
                              () => GoRouter.of(context)
                                  .go(AppRoutes.gameSettings));
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
