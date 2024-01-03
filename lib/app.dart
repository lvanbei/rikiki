import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki_for_real/core/constants/routes.dart';
import 'package:rikiki_for_real/screens/screens.dart';

import 'core/core.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.black,
          titleTextStyle: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColors.white),
        ),
        scaffoldBackgroundColor: AppColors.white,
        primarySwatch: getMaterialColor(AppColors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                foregroundColor: AppColors.white,
                textStyle: const TextStyle(fontSize: 36))),
      ),
      title: 'Rikiki',
      routerConfig: GoRouter(
        initialLocation: AppRoutes.home,
        navigatorKey: GlobalKey<NavigatorState>(),
        routes: [
          ShellRoute(
            observers: [MyObserver(context: context)],
            builder: (context, state, child) => BaseScreen(child: child),
            routes: [
              GoRoute(
                  name: AppRouteNames.home,
                  path: AppRoutes.home,
                  pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const HomeScreen(),
                      )),
              GoRoute(
                  name: AppRouteNames.addPlayers,
                  path: AppRoutes.addPlayers,
                  pageBuilder: (context, state) => NoTransitionPage(
                        name: state.fullPath,
                        key: state.pageKey,
                        child: const Center(child: Text("add player")),
                      )),
            ],
          )
        ],
      ),
    );
  }
}

class MyObserver extends NavigatorObserver {
  final BuildContext context;

  MyObserver({required this.context});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    getIt
        .get<BaseCubit>()
        .displayBackArrow(route.settings.name == AppRoutes.home);
  }

  // @override
  // void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
  //   print('MyTest didReplace: $newRoute');
  // }

  // @override
  // void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   print('MyTest didPop: $route');
  // }

  // @override
  // void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   print('MyTest didRemove: $route');
  // }
}
