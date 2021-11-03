import 'package:zam_todo/zam_todo.dart';

import '../_mocks/_.index.dart';

final composer = MockComposer();
final application = composer.build() as ZamTodoApplication;
final eventBus = application.eventBus;
final db = application.provider.resolve<Database>() as MockDatabase;

Future<void> setupForIntegrationTesting() async {
  await application.initialize();
  await application.run();
}
