// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:zam_event_bus/zam_event_bus.dart';
import 'package:zam_event_bus_provider/zam_event_bus_provider.dart';

import 'navigation/route_manager.dart';
import 'pages/_view.imports.dart';

class RootView extends StatelessWidget {
  static final _primaryColor = Colors.yellow.shade700;

  final EventBus bus;
  final routeManager = ZamTodoRouteManager();

  RootView(this.bus);

  @override
  Widget build(BuildContext context) {
    return EventBusProvider(
      bus: bus,
      child: MaterialApp(
        title: TextTokens.appTitle,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: routeManager.onGenerateRoute,
        theme: ThemeData.dark().copyWith(
          primaryColor: _primaryColor,
          appBarTheme: AppBarTheme(
            backgroundColor: _primaryColor,
            foregroundColor: Colors.black,
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: _primaryColor,
          ),
        ),
      ),
    );
  }
}
