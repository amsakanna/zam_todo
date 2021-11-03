import '../_rule.imports.dart';
import 'todo.dart';
import 'todo_list_empty.exception.dart';

class TodoListShouldNotBeEmptyRule
    extends CompositeRule<Iterable<Todo>, Iterable<Todo>>
    with ExceptionThrowingAbility {
  @override
  final Iterable<Todo> fact;

  const TodoListShouldNotBeEmptyRule(this.fact);

  @override
  build() {
    return ListShouldNotBeEmptyRule(fact);
  }

  @override
  NamedException buildException(RuleResponse<Iterable<Todo>> response) {
    return const TodoListEmptyException();
  }
}
