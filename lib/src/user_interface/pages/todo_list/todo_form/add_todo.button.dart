import '../../_view.imports.dart';
import 'submit.button.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton();

  @override
  Widget build(BuildContext context) {
    return SubmitButton(
      text: 'Add',
      onPressed: () {
        final todo = context.fetch<TodoBeingEdited>();
        context.dispatch(AddTodoRequestedEvent(todo.content));
        Navigator.pop(context);
      },
    );
  }
}
