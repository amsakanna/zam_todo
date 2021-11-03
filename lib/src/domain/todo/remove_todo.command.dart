import '../_command.imports.dart';
import 'todo.dart';
import 'todo.entity.dart';

@immutable
class RemoveTodoCommand extends DatabaseCommand<TodoEntity, Todo> {
  @override
  final Database database;
  @override
  get table => Tables.todo;
  final String key;

  const RemoveTodoCommand(this.database, this.key);

  @override
  Future<Todo> execute() async {
    final removedEntity = await database.remove(table, key);
    return removedEntity.toModel();
  }
}
