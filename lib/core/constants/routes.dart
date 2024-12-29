abstract class AppRoutes {
  static const String selectGame = '/';
  static const String addPlayers = '/add-players';
  static const String gameSettings = '/game-settings';
  static const String setFolds = '/set-folds';
  static const String play = '/play';
  static const String checkFolds = '/check-folds';
  static const String scores = '/scores';
}

abstract class AppRouteNames {
  static const String home = 'home';
  static const String selectGame = 'select-game';
  static const String addPlayers = 'add-players';
  static const String gameSettings = 'game-settings';
  static const String setFolds = 'set-folds';
  static const String play = 'play';
  static const String checkFolds = 'check-folds';
  static const String scores = 'scores';
}

abstract class AppRouteList {
  static const List<String> routes = [
    AppRoutes.selectGame,
    AppRoutes.addPlayers,
    AppRoutes.gameSettings,
    AppRoutes.setFolds,
    AppRoutes.play,
    AppRoutes.checkFolds,
    AppRoutes.scores,
  ];
}
