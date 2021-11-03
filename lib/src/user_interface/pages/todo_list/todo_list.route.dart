import '../_route.imports.dart';
import 'todo_list.page.dart';

///
/// Contains a list of todos.
///
class TodoListRoute extends RouteInfo {
  @override
  final name = 'TodoListRoute';
  @override
  final path = '/todo';
  @override
  get builder => (context) => const TodoListPage();

  const TodoListRoute();
}
