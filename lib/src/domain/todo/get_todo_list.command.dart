import '../_command.imports.dart';
import 'todo.dart';
import 'todo.entity.dart';

@immutable
class GetTodoListCommand extends DatabaseCommand<TodoEntity, Todo> {
  @override
  final Database database;
  @override
  get table => Tables.todo;

  const GetTodoListCommand(this.database);

  @override
  Future<Iterable<Todo>> execute() {
    return database
        .getAll(table)
        .then((list) => list.map((item) => item.toModel()));
  }
}
