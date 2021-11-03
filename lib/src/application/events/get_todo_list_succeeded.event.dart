import '../_event.imports.dart';

@immutable
class GetTodoListSucceededEvent implements UseCaseEvent {
  final Iterable<Todo> todoList;

  const GetTodoListSucceededEvent(this.todoList);
}
