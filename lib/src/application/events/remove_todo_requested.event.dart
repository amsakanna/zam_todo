import '../_event.imports.dart';

@immutable
class RemoveTodoRequestedEvent {
  final String key;

  const RemoveTodoRequestedEvent(this.key);
}
