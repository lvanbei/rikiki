import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../base/base_cubit.dart';
import 'scores.dart';

class ScoresScreen extends StatelessWidget {
  final bool popupMode;
  const ScoresScreen({super.key, this.popupMode = false});

  static const double _width = 150;
  static const double _widthHeader = 20;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return BlocProvider(
      create: (_) =>
          ScoresCubit(baseCubit: context.read<BaseCubit>())..onWidgetDidInit(),
      child: BlocBuilder<ScoresCubit, ScoresState>(
        builder: (context, state) {
          if (state is ScoresLoadedState) {
            final bool isFinish = getRound(
                    isMinus: true,
                    playersLen: state.listOfPlayers.length,
                    round: state.round) ==
                0;
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 75,
                          child: Text(
                            '${state.listOfPlayers[1].name} : ${state.pointsWithIndex(1)}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 40,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(width: 1),
                            left: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                          )),
                          child: const Text(
                            '🥈',
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.5, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 75,
                          child: Text(
                            '${state.listOfPlayers[0].name} : ${state.pointsWithIndex(0)}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 50,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                            left: BorderSide(width: 1),
                            right: BorderSide(width: 1),
                          )),
                          child: const Text(
                            '🥇',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(height: 2, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 75,
                          child: Text(
                            '${state.listOfPlayers[2].name} : ${state.pointsWithIndex(2)}',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          width: 75,
                          height: 30,
                          decoration: const BoxDecoration(
                              border: Border(
                            top: BorderSide(width: 1),
                            bottom: BorderSide(width: 1),
                            right: BorderSide(width: 1),
                          )),
                          child: const Text(
                            '🥉 ',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(height: 1.2, fontSize: 24),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 64,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            constraints: const BoxConstraints(maxHeight: 36),
                            onPressed: () {
                              context
                                  .read<ScoresCubit>()
                                  .updatePlayer(isLeft: false);
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 16,
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        SizedBox(
                          width: 100,
                          child: Text(
                            state.listOfPlayers[state.selectedUser].name,
                            textAlign: TextAlign.center,
                            style: const TextStyle()
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        IconButton(
                            constraints: const BoxConstraints(maxHeight: 36),
                            onPressed: () {
                              context.read<ScoresCubit>().updatePlayer();
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 16,
                            )),
                      ],
                    ),
                    verticalSpacing(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Points : ',
                        ),
                        Text(
                          state.points.toString(),
                          style: const TextStyle()
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    verticalSpacing(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: _widthHeader,
                        ),
                        SizedBox(
                            width: _width,
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onDoubleTap: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: AppColors.black,
                                        content: SafeArea(
                                            child: Center(
                                          child: Text(
                                              'Total : ${state.announcedFoldTotal} folds'),
                                        )),
                                      ));
                                    },
                                    child: const Text(
                                      "Announced",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onDoubleTap: () {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        backgroundColor: AppColors.black,
                                        content: SafeArea(
                                            child: Center(
                                          child: Text(
                                              'Total : ${state.makedFoldTotal} folds'),
                                        )),
                                      ));
                                    },
                                    child: const Text(
                                      "Maked",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    verticalSpacing(),
                    SizedBox(
                      //to adapt hide button below !
                      height:
                          MediaQuery.of(context).size.height > 1000 ? 500 : 150,
                      child: SingleChildScrollView(
                        child: Column(children: folds(state)),
                      ),
                    )
                  ],
                ),
                if (!popupMode) ...[
                  const Expanded(child: SizedBox()),
                  MyButton(
                    title: !isFinish
                        ? 'Round ${getRound(playersLen: state.listOfPlayers.length, round: state.round)}'
                        : 'Home',
                    size: ButtonSizes.small,
                    onPressed: () {
                      if (!isFinish) {
                        context.read<BaseCubit>().updateRound(state.round);
                        Router.neglect(context,
                            () => GoRouter.of(context).go(AppRoutes.setFolds));
                      } else {
                        Router.neglect(
                            context,
                            () =>
                                GoRouter.of(context).go(AppRoutes.selectGame));
                      }
                    },
                  )
                ]
              ],
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }

  SizedBox verticalSpacing() {
    return const SizedBox(
      height: 16,
    );
  }

  List<Widget> folds(ScoresLoadedState state) {
    List<Widget> result = [];
    int index = 0;
    for (FoldsModel fold in state.listOfPlayers[state.selectedUser].folds) {
      if (index == state.round) break;
      result.add(Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: _widthHeader,
            child: Text(
              index + 1 <
                      (state.listOfPlayers[state.selectedUser].folds.length +
                              1) /
                          2
                  ? (index + 1).toString()
                  : (state.listOfPlayers[state.selectedUser].folds.length -
                          index)
                      .toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration:
                const BoxDecoration(border: Border(left: BorderSide(width: 1))),
            width: _width,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    fold.announcedFolds.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    fold.makedFolds.toString(),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ));
      index++;
    }
    return result;
  }
}
