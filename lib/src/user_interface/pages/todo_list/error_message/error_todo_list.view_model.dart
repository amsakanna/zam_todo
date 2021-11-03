import '../../_view_model.imports.dart';
import '../todo_list.view_model.dart';

@immutable
class ErrorTodoListViewModel extends ViewModel implements TodoListViewModel {
  @override
  get props => [];

  const ErrorTodoListViewModel();
}
