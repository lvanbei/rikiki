import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../base/base_cubit.dart';
import 'scores.dart';

class ScoresScreen extends StatelessWidget {
  const ScoresScreen({super.key});

  static const double _width = 75;

  //remove bloc?
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ScoresCubit(baseCubit: context.read<BaseCubit>())..onWidgetDidInit(),
      child: BlocBuilder<ScoresCubit, ScoresState>(
        builder: (context, state) {
          if (state is ScoresLoadedState) {
            return Center(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                              width: _width,
                              child: Text(
                                "Round",
                                textAlign: TextAlign.center,
                              )),
                          ...state.listOfPlayers.map((e) => SizedBox(
                              width: _width,
                              child: Text(
                                e.name,
                                textAlign: TextAlign.center,
                              )))
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                              width: _width,
                              child: Text(
                                "Points",
                                textAlign: TextAlign.center,
                              )),
                          ...state.listOfPlayers.map((e) => SizedBox(
                              width: _width,
                              child: Text(
                                e.points.toString(),
                                textAlign: TextAlign.center,
                              )))
                        ],
                      ),
                      ...state.listOfPlayers[0].folds.mapIndexed((index,
                              element) =>
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: _width,
                                child: Text(
                                  index + 1 <
                                          (state.listOfPlayers[0].folds.length +
                                                  1) /
                                              2
                                      ? (index + 1).toString()
                                      : (state.listOfPlayers[0].folds.length -
                                              index)
                                          .toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              ...state.listOfPlayers.map((e) => SizedBox(
                                    width: _width,
                                    child: Text(
                                      '${e.folds[index].announcedFolds.toString()} ${e.folds[index].makedFolds.toString()}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ))
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
