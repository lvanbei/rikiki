import 'package:rikiki_for_real/core/constants/routes.dart';

String getPreviousRoute(String route) {
  print(route);
  final int foundedRoute =
      AppRouteList.routes.indexWhere((element) => element == route);
  if (foundedRoute > 0) {
    return AppRouteList.routes[foundedRoute - 1];
  }
  return AppRouteList.routes[0];
}
