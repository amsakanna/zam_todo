import '../_use_case.imports.dart';

@immutable
class RemoveTodoUseCase extends SavingReactiveUseCase<RemoveTodoRequestedEvent>
    with HandleErrorStreamMixin {
  final Builder<Database> databaseBuilder;

  const RemoveTodoUseCase(this.databaseBuilder);

  @override
  Stream<UseCaseEvent> execute(RemoveTodoRequestedEvent event, EventBus bus) {
    final database = databaseBuilder();

    return RemoveTodoCommand(database, event.key)
        .execute()
        .asStream()
        .map<UseCaseEvent>((todo) => TodoRemovedEvent(todo))
        .doOnData((event) => bus.publish(TodoListRequestedEvent()))
        .onErrorResume(getErrorStream);
  }
}
