import '../../_view.imports.dart';
import 'submit.button.dart';

class SaveTodoButton extends StatelessWidget {
  const SaveTodoButton();

  @override
  Widget build(BuildContext context) {
    return SubmitButton(
      text: 'Save',
      onPressed: () {
        final todo = context.fetch<TodoBeingEdited>();
        context.dispatch(UpdateTodoRequestedEvent(todo.toModel()));
        Navigator.pop(context);
      },
    );
  }
}
