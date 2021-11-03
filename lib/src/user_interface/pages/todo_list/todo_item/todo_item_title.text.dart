import '../../_view.imports.dart';

class TodoItemTitleText extends StatelessWidget {
  final String text;

  const TodoItemTitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
