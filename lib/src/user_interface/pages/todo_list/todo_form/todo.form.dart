import '../../_view.imports.dart';
import 'add_todo.button.dart';
import 'save_todo.button.dart';
import 'todo_content.text_field.dart';

class TodoForm extends StatelessWidget {
  final bool isNew;
  final String todoContent;

  TodoForm.withCreateOption()
      : isNew = true,
        todoContent = '';
  TodoForm.withEditOption(TodoItemViewModel data)
      : isNew = false,
        todoContent = data.title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Card(
        margin: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TodoContentTextField(todoContent, isNew),
            ),
            Container(
              width: double.infinity,
              child: isNew ? const AddTodoButton() : const SaveTodoButton(),
            ),
          ],
        ),
      ),
    );
  }
}
