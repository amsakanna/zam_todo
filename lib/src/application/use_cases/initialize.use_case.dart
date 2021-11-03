// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import '../_use_case.imports.dart';

@immutable
class InitializeUseCase extends SavingUseCase<InitializeEvent> {
  InitializeUseCase();

  @override
  UseCaseEvent execute(InitializeEvent event, EventBus bus) {
    return InitializedEvent();
  }
}
