import '../_event.imports.dart';

@immutable
class UpdateTodoRequestedEvent {
  final Todo todo;

  const UpdateTodoRequestedEvent(this.todo);
}
