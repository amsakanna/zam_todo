import '../../_view_model.imports.dart';
import '../todo_item/todo_item.view_model.dart';
import '../todo_list.view_model.dart';

@immutable
class LoadedTodoListViewModel extends ListViewModel<TodoItemViewModel>
    implements TodoListViewModel {
  const LoadedTodoListViewModel({
    required List<TodoItemViewModel> items,
  }) : super(items);
}
