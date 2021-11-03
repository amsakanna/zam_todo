import '../../_view.imports.dart';

class CompletedTodoItemTitleText extends StatelessWidget {
  final String text;

  const CompletedTodoItemTitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            decoration: TextDecoration.lineThrough,
            color: Colors.grey,
          ),
    );
  }
}
