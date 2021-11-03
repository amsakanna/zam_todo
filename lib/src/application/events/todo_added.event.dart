import '../_event.imports.dart';

@immutable
class TodoAddedEvent implements UseCaseEvent {
  final Todo todo;

  const TodoAddedEvent(this.todo);
}
