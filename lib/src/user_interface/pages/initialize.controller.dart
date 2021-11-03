// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:zam_todo/src/user_interface/pages/todo_list/todo_list.view_model.dart';

import '_controller.imports.dart';

class InitializeController
    extends EventTransformer<InitializeUIEvent, InitializeEvent> {
  const InitializeController();

  @override
  execute(event, bus) {
    bus.save(TodoListViewModel());
    bus.save(TodoBeingEdited(
      key: '',
      content: '',
      completed: false,
    ));
    return InitializeEvent();
  }
}
