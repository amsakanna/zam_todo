import 'ports/table.dart';
import 'todo/todo.entity.dart';

class Tables {
  static final list = [todo];

  static final todo = Table<TodoEntity>(
    name: 'todo',
    createEntity: (json) => TodoEntity.fromJson(json),
    serialize: (entity) => entity.toJson(),
  );
}
