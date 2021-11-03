import '../_.imports.dart';

class ErrorMessageText extends StatelessWidget {
  final String text;

  const ErrorMessageText(this.text);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
