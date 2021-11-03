import '../_use_case.imports.dart';

@immutable
class GetTodoListUseCase extends SavingReactiveUseCase<TodoListRequestedEvent>
    with HandleErrorStreamMixin {
  final Builder<Database> databaseBuilder;

  const GetTodoListUseCase(this.databaseBuilder);

  @override
  Stream<UseCaseEvent> execute(TodoListRequestedEvent event, EventBus bus) {
    final database = databaseBuilder();
    return GetTodoListCommand(database)
        .execute()
        .asStream()
        .map((list) =>
            TodoListShouldNotBeEmptyRule(list).applyAndThrow().value!.toList())
        .map<UseCaseEvent>((list) => GetTodoListSucceededEvent(list))
        .onErrorResume(getErrorStream);
  }
}
