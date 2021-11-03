import '../../_view.imports.dart';

class TodoContentTextField extends StatefulWidget {
  final String text;
  final bool isNew;

  const TodoContentTextField(this.text, this.isNew);

  @override
  State<TodoContentTextField> createState() => _TodoContentTextFieldState();
}

class _TodoContentTextFieldState extends State<TodoContentTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller =
        TextEditingController.fromValue(TextEditingValue(text: widget.text));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.white,
      autofocus: true,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
      onChanged: (text) {
        final oldTodo = context.fetch<TodoBeingEdited>();
        context.save(oldTodo.withNewContent(text));
      },
      onSubmitted: (text) {
        final todo = context.fetch<TodoBeingEdited>();
        final event = widget.isNew
            ? AddTodoRequestedEvent(todo.content)
            : UpdateTodoRequestedEvent(todo.toModel());
        context.dispatch(event);
        Navigator.pop(context);
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
