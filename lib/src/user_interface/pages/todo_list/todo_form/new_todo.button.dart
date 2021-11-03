import '../../_view.imports.dart';
import 'todo.form.dart';

class NewTodoButton extends StatelessWidget {
  const NewTodoButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.save(TodoBeingEdited.initialized());
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return TodoForm.withCreateOption();
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
