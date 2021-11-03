import '../_entity.imports.dart';
import 'todo.dart';

@immutable
class TodoEntity extends Entity<Todo> {
  @override
  final String key;
  final String content;
  final bool completed;

  @override
  get props => [key];

  const TodoEntity({
    required this.key,
    required this.content,
    required this.completed,
  });

  TodoEntity.fromJson(Json json)
      : this(
          key: json['key'] as String,
          content: json['content'] as String,
          completed: json['completed'] as bool,
        );

  TodoEntity.fromModel(Todo model)
      : this(
          key: model.key,
          content: model.content,
          completed: model.completed,
        );

  @override
  Json toJson() {
    return {
      'key': key,
      'content': content,
      'completed': completed,
    };
  }

  @override
  Todo toModel() {
    return Todo(
      key: key,
      content: content,
      completed: completed,
    );
  }
}
