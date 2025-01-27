import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki/screens/screens.dart';
import 'package:universal_html/html.dart' as html;

import '../../core/core.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  const BaseScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final fullPath = GoRouterState.of(context).fullPath;
    final isAddPlayer = fullPath == AppRoutes.addPlayers;
    final isSelectGame = fullPath == AppRoutes.selectGame;
    final isScores = fullPath == AppRoutes.scores;

    return BlocBuilder<BaseCubit, BaseState>(
      builder: (context, state) {
        if (state is BaseLoadedState) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: InkWell(
                  onDoubleTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.black,
                        content: SafeArea(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Version : ${state.meta.version}'),
                                Text(displayFormat.format(
                                    state.meta.updateDateTime ??
                                        DateTime.now()))
                              ]),
                        ),
                      ),
                    );
                  },
                  child: const Text('RIKIKI')),
              actions: (!isAddPlayer ||
                          (state.games.isNotEmpty &&
                              state.games[state.selectedGameIndex].round !=
                                  0)) &&
                      !isSelectGame
                  ? [
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                content: ScoresScreen(popupMode: true),
                                backgroundColor: AppColors.white,
                              ),
                            );
                          },
                          icon: const Icon(Icons.scoreboard_sharp))
                    ]
                  : null,
              leading: isSelectGame
                  ? null
                  : IconButton(
                      onPressed: () async {
                        if (isScores &&
                            getRound(
                                    isMinus: true,
                                    rounds: state
                                        .games[state.selectedGameIndex].rounds,
                                    round: state.games[state.selectedGameIndex]
                                        .round) ==
                                -1) {
                          return Router.neglect(
                              context,
                              () => GoRouter.of(context)
                                  .go(AppRoutes.selectGame));
                        }
                        final prev = getPreviousRoute(fullPath ?? '/');
                        Router.neglect(
                            context, () => GoRouter.of(context).go(prev));
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.white,
                      )),
            ),
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: 24,
                        bottom: kIsWeb &&
                                html.window
                                    .matchMedia('(display-mode: standalone)')
                                    .matches
                            ? 60
                            : 24),
                    child: child)),
          );
        }
        return const LoadingScreen();
      },
    );
  }
}
