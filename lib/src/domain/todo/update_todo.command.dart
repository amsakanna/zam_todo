import '../_command.imports.dart';
import 'todo.dart';
import 'todo.entity.dart';

@immutable
class UpdateTodoCommand extends DatabaseCommand<TodoEntity, Todo> {
  @override
  final Database database;
  @override
  get table => Tables.todo;
  final Todo todo;

  const UpdateTodoCommand(this.database, this.todo);

  @override
  Future<Todo> execute() async {
    final updatedEntity =
        await database.update(table, TodoEntity.fromModel(todo));
    return updatedEntity.toModel();
  }
}
