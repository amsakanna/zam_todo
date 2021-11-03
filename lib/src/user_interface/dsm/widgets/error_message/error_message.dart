import '../_.imports.dart';
import 'error.image.dart';
import 'error_message.text.dart';
import 'error_message_title.text.dart';

class ErrorMessage extends StatelessWidget {
  final String title;
  final String message;
  final String imagePath;

  const ErrorMessage({
    required this.title,
    required this.message,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ErrorImage(imagePath),
        const SizedBox(height: 40),
        ErrorMessageTitleText(title),
        const SizedBox(height: 12),
        ErrorMessageText(message),
      ],
    );
  }
}
