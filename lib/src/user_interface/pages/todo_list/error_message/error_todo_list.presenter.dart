import '../../_presenter.imports.dart';
import '../todo_list.view_model.dart';
import 'empty_todo_list.view_model.dart';
import 'error_todo_list.view_model.dart';

@immutable
class ErrorTodoListPresenter
    extends ViewModelMapper<UseCaseFailedEvent, TodoListViewModel> {
  const ErrorTodoListPresenter();

  @override
  execute(event, bus) {
    if (event.exception is TodoListEmptyException) {
      return const EmptyTodoListViewModel();
    } else {
      return const ErrorTodoListViewModel();
    }
  }
}
