import '../pages/_route.index.dart';
import 'route_info.dart';

class Routes {
  static const map = {
    'TodoListRoute': todoList,
  };

  static const home = todoList;
  static const todoList = TodoListRoute();

  static RouteInfo find(String name) {
    return map[name] ?? home;
  }
}
