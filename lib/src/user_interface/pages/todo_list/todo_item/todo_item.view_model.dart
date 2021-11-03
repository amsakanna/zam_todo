import '../../_view_model.imports.dart';

@immutable
class TodoItemViewModel extends ViewModel
    implements Comparable<TodoItemViewModel> {
  final String key;
  final String title;
  final bool completed;

  @override
  get props => [key];

  const TodoItemViewModel({
    required this.key,
    required this.title,
    required this.completed,
  });

  @override
  int compareTo(TodoItemViewModel other) {
    if (completed == other.completed) {
      return int.parse(key).compareTo(int.parse(other.key));
    } else if (completed) {
      return 1;
    } else {
      return -1;
    }
  }
}
