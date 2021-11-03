import '../../_view.imports.dart';

class TodoItemSubtitleText extends StatelessWidget {
  const TodoItemSubtitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
