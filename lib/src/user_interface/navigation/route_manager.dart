import 'package:flutter/material.dart';

import 'routes.dart';

class ZamTodoRouteManager {
  Route onGenerateRoute(RouteSettings settings) {
    final routeName = settings.name ?? Routes.home.name;
    final route = Routes.find(routeName);
    return MaterialPageRoute(builder: route.builder);
  }
}
