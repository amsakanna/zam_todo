import '../../_view.imports.dart';

class TodoListTitleText extends StatelessWidget {
  final String text;

  const TodoListTitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
