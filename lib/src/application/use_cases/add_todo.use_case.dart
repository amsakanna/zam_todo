import '../_use_case.imports.dart';

@immutable
class AddTodoUseCase extends SavingReactiveUseCase<AddTodoRequestedEvent> {
  final Builder<Database> databaseBuilder;

  const AddTodoUseCase(this.databaseBuilder);

  @override
  Stream<UseCaseEvent> execute(AddTodoRequestedEvent event, EventBus bus) {
    final database = databaseBuilder();
    final todo = Todo.createNew(event.todoContent);

    return AddTodoCommand(database, todo)
        .execute()
        .asStream()
        .map<UseCaseEvent>((todo) => TodoAddedEvent(todo))
        .doOnData((event) => bus.publish(TodoListRequestedEvent()))
        .onErrorResume(_getErrorStream);
  }

  Stream<UseCaseEvent> _getErrorStream(exception, stackTrace) {
    exception = exception is NamedException
        ? exception
        : UnknownException(
            stackTrace: StackTrace.fromString('$exception\n$stackTrace'));
    return Stream.value(UseCaseFailedEvent(exception));
  }
}
