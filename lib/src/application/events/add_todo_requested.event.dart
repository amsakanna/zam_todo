import '../_event.imports.dart';

@immutable
class AddTodoRequestedEvent {
  final String todoContent;

  const AddTodoRequestedEvent(this.todoContent);
}
