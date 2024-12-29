import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki/screens/screens.dart';

import 'core/core.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionContainer.disabled(
      child: BlocProvider(
        create: (_) => BaseCubit()..onWidgetDidInit(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Urbanist',
            dialogBackgroundColor: AppColors.white,
            dialogTheme: DialogTheme.of(context).copyWith(
              surfaceTintColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: AppColors.black,
              titleTextStyle: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(
                      color: AppColors.white,
                      fontFamily: 'Urbanist',
                      letterSpacing: 18),
            ),
            scaffoldBackgroundColor: AppColors.white,
            colorScheme: Theme.of(context)
                .colorScheme
                .copyWith(primary: AppColors.black),
            iconButtonTheme: IconButtonThemeData(
                style: IconButton.styleFrom(
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.white,
              disabledForegroundColor: AppColors.grey,
              disabledBackgroundColor: AppColors.lightGrey,
            )),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontFamily: 'Urbanist'),
              backgroundColor: AppColors.black,
              foregroundColor: AppColors.white,
              disabledForegroundColor: AppColors.grey,
              disabledBackgroundColor: AppColors.lightGrey,
            )),
          ),
          title: 'R I K I K I',
          routerConfig: GoRouter(
            navigatorKey: rootNavigatorKey,
            initialLocation: AppRoutes.selectGame,
            routes: [
              ShellRoute(
                navigatorKey: _shellNavigatorKey,
                builder: (context, state, child) => BaseScreen(child: child),
                routes: [
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.selectGame,
                    path: AppRoutes.selectGame,
                    pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const SelectGameScreen()),
                  ),
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.addPlayers,
                    path: AppRoutes.addPlayers,
                    pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const AddPlayersScreen()),
                  ),
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.gameSettings,
                    path: AppRoutes.gameSettings,
                    pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const GameSettingsScreen()),
                  ),
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.setFolds,
                    path: AppRoutes.setFolds,
                    pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const SetFoldsScreen()),
                  ),
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.play,
                    path: AppRoutes.play,
                    pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const PlayScreen()),
                  ),
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.checkFolds,
                    path: AppRoutes.checkFolds,
                    pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const CheckFoldsScreen()),
                  ),
                  GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.scores,
                    path: AppRoutes.scores,
                    pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const ScoresScreen()),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
