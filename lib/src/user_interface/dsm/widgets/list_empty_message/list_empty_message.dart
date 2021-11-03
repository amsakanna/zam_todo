import '../_.imports.dart';
import '../error_message/error_message.dart';

class ListEmptyMessage extends StatelessWidget {
  final String title;
  final String message;

  const ListEmptyMessage({
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return ErrorMessage(
      imagePath: ImageTokens.emptyListImage,
      title: title,
      message: message,
    );
  }
}
