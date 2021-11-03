import '../_.imports.dart';

void main() {
  GetTodoListCommandTest().execute();
}

enum Scenario {
  todoListIsEmpty,
  todoListIsNotEmpty,
  unknownExceptionOccured,
}

class GetTodoListCommandTest extends Test<Scenario, Stream<Iterable<Todo>>> {
  @override
  run(Scenario input) {
    final table = Tables.todo;

    switch (input) {
      case Scenario.todoListIsNotEmpty:
        when(db.getAll(table))
            .thenAnswer((_) => Future.value(dummyTodoEntityList));
        break;
      case Scenario.todoListIsEmpty:
        when(db.getAll(table)).thenAnswer((_) => Future.value([]));
        break;
      default:
        when(db.getAll(table)).thenAnswer((_) => Future.error('Unknown Error'));
    }
    return GetTodoListCommand(db).execute().asStream();
  }

  @override
  get cases => [
        TestCase(
          when: 'When some todos are available',
          then: 'we get a non-empty result set',
          input: Scenario.todoListIsNotEmpty,
          matcher: emits(dummyTodoList),
        ),
        TestCase(
          when: 'When there are no todos',
          then: 'we get an empty result set',
          input: Scenario.todoListIsEmpty,
          matcher: emits([]),
        ),
      ];
}
