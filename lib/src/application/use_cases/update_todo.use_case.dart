import '../_use_case.imports.dart';

@immutable
class UpdateTodoUseCase extends SavingReactiveUseCase<UpdateTodoRequestedEvent>
    with HandleErrorStreamMixin {
  final Builder<Database> databaseBuilder;

  const UpdateTodoUseCase(this.databaseBuilder);

  @override
  Stream<UseCaseEvent> execute(UpdateTodoRequestedEvent event, EventBus bus) {
    final database = databaseBuilder();

    return UpdateTodoCommand(database, event.todo)
        .execute()
        .asStream()
        .map<UseCaseEvent>((todo) => TodoUpdatedEvent(todo))
        .doOnData((event) => bus.publish(TodoListRequestedEvent()))
        .onErrorResume(getErrorStream);
  }
}
