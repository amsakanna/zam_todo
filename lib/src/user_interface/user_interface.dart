// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:zam_event_bus/zam_event_bus.dart';

import 'pages/_controller.index.dart';
import 'pages/_event.index.dart';
import 'pages/_presenter.index.dart';
import 'root.view.dart';

export 'pages/_controller.index.dart';
export 'pages/_event.index.dart';
export 'pages/_presenter.index.dart';
export 'root.view.dart';

class ZamTodoUserInterface extends BasicUserInterface {
  @override
  final eventTransformers = [
    InitializeController(),
    TodoListPresenter(),
    ErrorTodoListPresenter(),
  ];

  final RootView rootView;

  ZamTodoUserInterface(EventBus eventBus)
      : rootView = RootView(eventBus),
        super(eventBus);

  late final StreamSubscription sub;

  @override
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    sub = eventBus.select<UseCaseFailedEvent>().listen((event) {
      // ignore: avoid_print
      print(event.exception);
    });
    eventBus.publish(InitializeUIEvent());
    super.initialize();
  }

  @override
  run() async {
    runApp(rootView);
  }

  @override
  dispose() async {
    sub.cancel();
  }
}
