import '../_event.imports.dart';

@immutable
class TodoUpdatedEvent implements UseCaseEvent {
  final Todo todo;

  const TodoUpdatedEvent(this.todo);
}
