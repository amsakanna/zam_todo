import 'src/composition/composer.dart';

void main() async {
  ZamTodoProdComposer().run();

  // final todo = TodoEntity(
  //   key: 'todo-1',
  //   content: 'Clean the room',
  // );
  // final todo2 = TodoEntity(
  //   key: 'todo-2',
  //   content: 'Go to gym',
  // );

  // final db = await Hive.openBox('todoDatabase');
  // final db2 = await Hive.openBox('todoCategoryDatabase');
  // await db.put(todo.key, todo.toJson());
  // await db2.put(todo2.key, todo2.toJson());
  // print(TodoEntity.fromJson(db.get(todo.key)).content);
  // print(TodoEntity.fromJson(db2.get(todo2.key)).content);
}
