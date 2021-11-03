import '../_.imports.dart';
import '../error_message/error_message.dart';

class UnknownErrorMessage extends StatelessWidget {
  const UnknownErrorMessage();

  @override
  Widget build(BuildContext context) {
    return const ErrorMessage(
      title: TextTokens.unknownErrorMessageTitle,
      message: TextTokens.unknownErrorMessage,
      imagePath: ImageTokens.unknownErrorImage,
    );
  }
}
