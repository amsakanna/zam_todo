import '../_command.imports.dart';
import 'todo.dart';
import 'todo.entity.dart';

@immutable
class AddTodoCommand extends DatabaseCommand<TodoEntity, Todo> {
  @override
  final Database database;
  @override
  get table => Tables.todo;
  final Todo todo;

  const AddTodoCommand(this.database, this.todo);

  @override
  Future<Todo> execute() async {
    final addedEntity = await database.add(table, TodoEntity.fromModel(todo));
    return addedEntity.toModel();
  }
}
