import '_.imports.dart';

void main() async {
  await setupForIntegrationTesting();
  GetTodoListUseCaseTest().execute();
}

enum Scenario {
  todoListIsEmpty,
  todoListIsNotEmpty,
  unknownExceptionOccured,
}

class GetTodoListUseCaseTest extends Test<Scenario, Stream<UseCaseEvent>> {
  @override
  Stream<UseCaseEvent> run(Scenario input) {
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
    eventBus.publish(const TodoListRequestedEvent());
    return eventBus.select<UseCaseEvent>();
  }

  @override
  get cases => [
        TestCase(
          when: 'When some todo categories are available',
          then: 'we get GetTodoListSucceededEvent containing the todo list',
          input: Scenario.todoListIsNotEmpty,
          matcher: emits(isA<GetTodoListSucceededEvent>()),
        ),
        TestCase(
          when: 'When there are no todo categories',
          then: 'we get UseCaseFailedEvent with TodoListEmptyException',
          input: Scenario.todoListIsEmpty,
          matcher: emits(isA<UseCaseFailedEvent>()),
        ),
        TestCase(
          when: 'When any unknown exception occurs',
          then: 'we get UseCaseFailedEvent with UnknownException',
          input: Scenario.unknownExceptionOccured,
          matcher: emits(isA<UseCaseFailedEvent>()),
        ),
      ];
}
