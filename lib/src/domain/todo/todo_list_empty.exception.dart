import '../_exception.imports.dart';

class TodoListEmptyException extends NamedException {
  @override
  String get problem => 'No items found!';
  @override
  String get solution => 'Create your first todo item.';
  @override
  ExceptionSeverity get severity => ExceptionSeverity.none;

  const TodoListEmptyException();
}
