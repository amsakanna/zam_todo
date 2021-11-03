import '../_event.imports.dart';

@immutable
class TodoCompletedEvent implements UseCaseEvent {
  final Todo todo;

  const TodoCompletedEvent(this.todo);
}
