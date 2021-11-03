import '../../_presenter.imports.dart';
import '../todo_item/todo_item.view_model.dart';
import 'loaded_todo_list.view_model.dart';

@immutable
class TodoListPresenter extends ViewModelMapper<GetTodoListSucceededEvent,
    LoadedTodoListViewModel> {
  const TodoListPresenter();

  @override
  execute(event, bus) {
    final items = event.todoList.map(buildItem).toList()..sort();
    return LoadedTodoListViewModel(items: items);
  }

  TodoItemViewModel buildItem(Todo todo) {
    return TodoItemViewModel(
      key: todo.key,
      title: todo.content,
      completed: todo.completed,
    );
  }
}
