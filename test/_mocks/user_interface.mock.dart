// ignore_for_file: prefer_const_constructors

import 'package:zam_core/rxdart.dart';
import 'package:zam_todo/zam_todo.dart';

class MockUserInterface extends BasicUserInterface {
  @override
  final eventTransformers = [
    InitializeController(),
  ];
  final subs = CompositeSubscription();

  MockUserInterface(EventBus eventBus) : super(eventBus);

  @override
  run() async {
    eventBus.publish(InitializeUIEvent());
  }

  @override
  dispose() async {
    subs.dispose();
  }
}
