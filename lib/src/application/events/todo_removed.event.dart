import '../_event.imports.dart';

@immutable
class TodoRemovedEvent implements UseCaseEvent {
  final Todo todo;

  const TodoRemovedEvent(this.todo);
}
