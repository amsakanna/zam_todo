import 'package:flutter/material.dart';

abstract class RouteInfo<T extends Object?> {
  String get name;
  String get path;
  WidgetBuilder get builder;

  const RouteInfo();
}
