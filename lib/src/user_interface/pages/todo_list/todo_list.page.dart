import '../_page.imports.dart';
import 'error_message/empty_todo_list.view_model.dart';
import 'error_message/empty_todo_list_message.dart';
import 'error_message/error_todo_list.view_model.dart';
import 'loading_indicator/loading_indicator.container.dart';
import 'loading_indicator/loading_todo_list.view_model.dart';
import 'todo_form/new_todo.button.dart';
import 'todo_list/loaded_todo_list.view_model.dart';
import 'todo_list/todo.list.dart';
import 'todo_list.view_model.dart';
import 'todo_list_title_text/todo_list_title.text.dart';

class TodoListPage extends StatelessWidget {
  static final route = Routes.todoList;

  const TodoListPage();

  @override
  Widget build(BuildContext context) {
    context.dispatch(const TodoListRequestedEvent());
    context.dispatch(const LoadingTodoListViewModel());

    return Scaffold(
      floatingActionButton: NewTodoButton(),
      appBar: AppBar(
        title: TodoListTitleText(TextTokens.todoListPageTitle),
      ),
      body: AdaptiveScaffoldBody(
        maxWidth: SizeTokens.pageMaxWidth,
        child: View<TodoListViewModel>(
          builder: (data) {
            if (data is LoadedTodoListViewModel) {
              return TodoList(data);
            } else if (data is EmptyTodoListViewModel) {
              return const EmptyTodoListMessage();
            } else if (data is ErrorTodoListViewModel) {
              return const Center(
                child: UnknownErrorMessage(),
              );
            } else {
              return const LoadingIndicatorContainer();
            }
          },
        ),
      ),
    );
  }
}
