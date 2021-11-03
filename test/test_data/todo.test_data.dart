import '_.imports.dart';

final dummyTodoList = getDummyTodoList();
final dummyTodoEntityList = getDummyTodoEntityList();
final dummyTodo = getDummyTodo();
final dummyTodoEntity = getDummyTodoEntity();

Iterable<Todo> getDummyTodoList() {
  return getDummyTodoEntityList().map((entity) => entity.toModel());
}

Iterable<TodoEntity> getDummyTodoEntityList() {
  return [
    const TodoEntity(
      key: 'todo-1',
      content: 'Tomatoes',
      completed: false,
    )
  ];
}

Todo getDummyTodo() {
  return getDummyTodoList().first;
}

TodoEntity getDummyTodoEntity() {
  return getDummyTodoEntityList().first;
}
