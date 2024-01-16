import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki_for_real/screens/screens.dart';

import '../../core/core.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  const BaseScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final fullPath = GoRouterState.of(context).fullPath;
    final isHome = fullPath == AppRoutes.home;
    return BlocBuilder<BaseCubit, BaseState>(
      builder: (context, state) {
        if (state is BaseLoadedState) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('RIKIKI'),
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: ScoresScreen(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.scoreboard_sharp))
              ],
              leading: isHome
                  ? null
                  : IconButton(
                      onPressed: () async {
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
                    padding: const EdgeInsets.only(top: 24, bottom: 60),
                    child: child)),
          );
        }
        return const LoadingScreen();
      },
    );
  }
}
