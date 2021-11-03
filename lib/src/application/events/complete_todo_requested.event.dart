import '../_event.imports.dart';

@immutable
class CompleteTodoRequestedEvent {
  final String key;

  const CompleteTodoRequestedEvent(this.key);
}
