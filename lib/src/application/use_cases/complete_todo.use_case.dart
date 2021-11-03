import 'package:zam_todo/application.dart';

import '../_use_case.imports.dart';

@immutable
class CompleteTodoUseCase
    extends SavingReactiveUseCase<CompleteTodoRequestedEvent>
    with HandleErrorStreamMixin {
  final Builder<Database> databaseBuilder;

  const CompleteTodoUseCase(this.databaseBuilder);

  @override
  Stream<UseCaseEvent> execute(CompleteTodoRequestedEvent event, EventBus bus) {
    final database = databaseBuilder();
    final todo = bus
        .selectFromStore<GetTodoListSucceededEvent>()
        .todoList
        .firstWhere((todo) => todo.key == event.key);
    final completedTodo = todo.markCompleted();

    return RemoveTodoCommand(database, completedTodo.key)
        .execute()
        .asStream()
        .switchMap((removedTodo) => AddTodoCommand(database, completedTodo)
            .execute()
            .asStream()
            .map<UseCaseEvent>((todo) => TodoCompletedEvent(todo))
            .doOnData((event) => bus.publish(TodoListRequestedEvent()))
            .onErrorResume(getErrorStream));
  }
}
