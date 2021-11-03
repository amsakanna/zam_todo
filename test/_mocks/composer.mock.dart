import '_.imports.dart';

class MockComposer extends Composer {
  @override
  final config = const MockComposerConfig();

  @override
  Application build() {
    final eventBus = EventBus();
    final userInterface = MockUserInterface(eventBus);
    final provider = KiwiContainer();
    provider.registerSingleton<Database>((container) => MockDatabase());
    final application = ZamTodoApplication(userInterface, eventBus, provider);
    return application;
  }
}

class MockComposerConfig extends TestComposerConfig {
  const MockComposerConfig();
}
