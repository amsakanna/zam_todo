import '../_model.imports.dart';

@immutable
class Todo extends Model {
  final String key;
  final String content;
  final bool completed;

  @override
  get props => [key];

  const Todo({
    required this.key,
    required this.content,
    this.completed = false,
  });

  const Todo.createNew(
    this.content,
  )   : key = '',
        completed = false;

  Todo markCompleted() {
    return copyWith(completed: true);
  }

  Todo copyWith({
    String? key,
    String? content,
    bool? completed,
  }) {
    return Todo(
      key: key ?? this.key,
      content: content ?? this.content,
      completed: completed ?? this.completed,
    );
  }
}
