import '../../_view_model.imports.dart';

class TodoBeingEdited {
  final String key;
  final String content;
  final bool completed;

  const TodoBeingEdited({
    required this.key,
    required this.content,
    required this.completed,
  });
  const TodoBeingEdited.initialized()
      : key = '',
        content = '',
        completed = false;

  TodoBeingEdited withNewContent(String content) {
    return TodoBeingEdited(
      key: key,
      content: content,
      completed: completed,
    );
  }

  Todo toModel() {
    return Todo(
      key: key,
      content: content,
      completed: completed,
    );
  }
}
