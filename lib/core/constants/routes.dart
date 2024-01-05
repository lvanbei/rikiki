abstract class AppRoutes {
  static const String home = '/';
  static const String addPlayers = '/add-players';
  static const String game = '/game';
}

abstract class AppRouteNames {
  static const String home = 'home';
  static const String addPlayers = 'add-players';
  static const String game = 'game';
}

abstract class AppRouteList {
  static const List<String> routes = [
    AppRoutes.home,
    AppRoutes.addPlayers,
    AppRoutes.game,
  ];
}
