import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rikiki_for_real/screens/screens.dart';

import 'core/core.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BaseCubit()..onWidgetDidInit(),
      child: MaterialApp.router(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.black,
            titleTextStyle: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: AppColors.white),
          ),
          scaffoldBackgroundColor: AppColors.white,
          colorScheme:
              Theme.of(context).colorScheme.copyWith(primary: AppColors.black),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.black,
                  foregroundColor: AppColors.white,
                  textStyle: const TextStyle(fontSize: 36))),
        ),
        title: 'Rikiki',
        routerConfig: GoRouter(
          navigatorKey: rootNavigatorKey,
          initialLocation: AppRoutes.home,
          routes: [
            ShellRoute(
              navigatorKey: _shellNavigatorKey,
              builder: (context, state, child) => BaseScreen(child: child),
              routes: [
                GoRoute(
                    parentNavigatorKey: _shellNavigatorKey,
                    name: AppRouteNames.home,
                    path: AppRoutes.home,
                    pageBuilder: (context, GoRouterState state) =>
                        NoTransitionPage(
                          name: state.fullPath,
                          key: state.pageKey,
                          child: const HomeScreen(),
                        )),
                GoRoute(
                  parentNavigatorKey: _shellNavigatorKey,
                  name: AppRouteNames.addPlayers,
                  path: AppRoutes.addPlayers,
                  pageBuilder: (context, state) => NoTransitionPage(
                      name: state.fullPath,
                      key: state.pageKey,
                      child: const AddPlayersScreen()),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyObserver extends NavigatorObserver {
  final BuildContext context;

  MyObserver({required this.context});

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // Future.delayed(const Duration(seconds: 2), () {
    //   context
    //       .read<BaseCubit>()
    //       .displayBackArrow(route.settings.name == AppRoutes.home);
    // });
    //BlocProvider.of<BaseCubit>().displayBackArrow(true);
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
