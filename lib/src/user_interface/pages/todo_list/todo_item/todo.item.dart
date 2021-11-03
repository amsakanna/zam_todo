import '../../_view.imports.dart';
import '../todo_form/todo.form.dart';
import 'completed_todo_item_title.text.dart';
import 'todo_item.view_model.dart';
import 'todo_item_title.text.dart';

class TodoItem extends StatelessWidget {
  final TodoItemViewModel data;

  const TodoItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      child: data.completed ? buildCompletedTile(context) : buildTile(context),
    );
  }

  Widget buildCompletedTile(BuildContext context) {
    return Dismissible(
      key: Key(data.key),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        context.publish(RemoveTodoRequestedEvent(data.key));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Todo deleted!')));
      },
      background: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.redAccent.shade200,
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.delete),
          ),
        ),
      ),
      child: ListTile(
        title: CompletedTodoItemTitleText(data.title),
      ),
    );
  }

  Widget buildTile(BuildContext context) {
    return Dismissible(
      key: Key(data.key),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          context.publish(CompleteTodoRequestedEvent(data.key));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Todo completed!')));
        } else if (direction == DismissDirection.endToStart) {
          context.publish(RemoveTodoRequestedEvent(data.key));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Todo deleted!')));
        }
      },
      background: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.redAccent.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(Icons.done),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Icon(Icons.delete),
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          context.save(TodoBeingEdited(
            key: data.key,
            content: data.title,
            completed: data.completed,
          ));
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return TodoForm.withEditOption(data);
            },
          );
        },
        child: ListTile(
          title: TodoItemTitleText(data.title),
        ),
      ),
    );
  }
}
