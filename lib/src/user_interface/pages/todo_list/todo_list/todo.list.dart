import '../../_view.imports.dart';
import '../todo_item/todo.item.dart';
import 'loaded_todo_list.view_model.dart';

class TodoList extends StatelessWidget {
  final LoadedTodoListViewModel data;

  const TodoList(this.data);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      // itemExtent: SizeTokens.todoItemHeight,
      physics: const BouncingScrollPhysics(),
      itemCount: data.itemCount,
      itemBuilder: (context, index) => TodoItem(data.items[index]),
      separatorBuilder: (context, index) => Divider(
        height: 2,
        color: Colors.white30,
      ),
    );
  }
}
