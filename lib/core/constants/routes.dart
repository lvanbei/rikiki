abstract class AppRoutes {
  static const String home = '/';
  static const String addPlayers = '/add-players';
  static const String setFolds = '/set-folds';
  static const String play = '/play';
  static const String checkFolds = '/check-folds';
}

abstract class AppRouteNames {
  static const String home = 'home';
  static const String addPlayers = 'add-players';
  static const String setFolds = 'set-folds';
  static const String play = 'play';
  static const String checkFolds = 'check-folds';
}

abstract class AppRouteList {
  static const List<String> routes = [
    AppRoutes.home,
    AppRoutes.addPlayers,
    AppRoutes.setFolds,
    AppRoutes.play,
    AppRoutes.checkFolds,
  ];
}
