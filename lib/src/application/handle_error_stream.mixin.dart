import 'package:zam_core/exception.dart';
import 'package:zam_event_bus/zam_event_bus.dart';

class HandleErrorStreamMixin {
  Stream<UseCaseEvent> getErrorStream(exception, stackTrace) {
    exception = exception is NamedException
        ? exception
        : UnknownException(
            stackTrace: StackTrace.fromString('$exception\n$stackTrace'));
    return Stream.value(UseCaseFailedEvent(exception));
  }
}
