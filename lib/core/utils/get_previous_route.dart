import 'package:rikiki/core/constants/routes.dart';

String getPreviousRoute(String route) {
  final int foundedRoute =
      AppRouteList.routes.indexWhere((element) => element == route);
  if (foundedRoute > 0) {
    return AppRouteList.routes[foundedRoute - 1];
  }
  return AppRouteList.routes[0];
}
