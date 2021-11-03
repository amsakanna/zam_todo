import '../../_view_model.imports.dart';
import '../todo_list.view_model.dart';

@immutable
class LoadingTodoListViewModel extends ViewModel implements TodoListViewModel {
  @override
  get props => [];

  const LoadingTodoListViewModel();
}
