import '../../_view.imports.dart';

class EmptyTodoListMessage extends StatelessWidget {
  const EmptyTodoListMessage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ErrorMessage(
        title: TextTokens.todoListEmptyMessageTitle,
        message: TextTokens.todoListEmptyMessage,
        imagePath: ImageTokens.emptyListImage,
      ),
    );
  }
}
