// ignore_for_file: prefer_const_constructors

import 'package:kiwi/kiwi.dart';
import 'package:zam_event_bus/zam_event_bus.dart';

import '../application/application.dart';
import '../infrastructure/infrastructure.dart';
import '../user_interface/user_interface.dart';

class ZamTodoProdComposer extends Composer {
  @override
  final config = const ZamTodoProdComposerConfig();

  @override
  Application build() {
    final eventBus = EventBus();
    final userInterface = ZamTodoUserInterface(eventBus);
    final provider = KiwiContainer();
    provider.registerSingleton<Database>((container) => HiveDatabase());
    final application = ZamTodoApplication(userInterface, eventBus, provider);
    return application;
  }
}

class ZamTodoProdComposerConfig extends ProdComposerConfig {
  const ZamTodoProdComposerConfig();
}
