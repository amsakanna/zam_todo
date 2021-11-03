import '../_.imports.dart';

void main() {
  TodoListShouldNotBeEmptyRuleTest().execute();
}

class TodoListShouldNotBeEmptyRuleTest
    extends Test<Iterable<Todo>, Iterable<Todo>> {
  @override
  run(Iterable<Todo> input) {
    return TodoListShouldNotBeEmptyRule(input).executeAndThrow().value!;
  }

  @override
  final cases = [
    NegativeTestCase(
      when: 'Empty todo list',
      input: [],
      exception: TodoListEmptyException,
    ),
    ValueTestCase(
      when: 'When a non-empty todo list is provided',
      then: 'we get the input back',
      input: dummyTodoList,
      output: dummyTodoList,
    ),
  ];
}
