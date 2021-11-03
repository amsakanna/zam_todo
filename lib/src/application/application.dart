// ignore_for_file: prefer_const_constructors

import 'package:kiwi/kiwi.dart';
import 'package:zam_event_bus/zam_event_bus.dart';

import '../domain/domain.dart';
import 'use_cases.dart';

export 'package:zam_event_bus/zam_event_bus.dart';

export 'events.dart';
export 'use_cases.dart';

class ZamTodoApplication extends BasicApplication {
  final KiwiContainer provider;

  @override
  get eventTransformers => [
        InitializeUseCase(),
        GetTodoListUseCase(() => provider.resolve<Database>()),
        AddTodoUseCase(() => provider.resolve<Database>()),
        UpdateTodoUseCase(() => provider.resolve<Database>()),
        CompleteTodoUseCase(() => provider.resolve<Database>()),
        RemoveTodoUseCase(() => provider.resolve<Database>()),
      ];

  ZamTodoApplication(
    UserInterface userInterface,
    EventBus eventBus,
    this.provider,
  ) : super(userInterface, eventBus);

  @override
  initialize() async {
    await super.initialize();
    final database = provider.resolve<Database>();
    await database.initialize(Tables.list);
  }
}
