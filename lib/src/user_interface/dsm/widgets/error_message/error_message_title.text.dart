import '../_.imports.dart';

class ErrorMessageTitleText extends StatelessWidget {
  final String text;

  const ErrorMessageTitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
