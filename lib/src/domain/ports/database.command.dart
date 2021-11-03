import 'package:zam_command_pattern/zam_command_pattern.dart';
import 'package:zam_core/zam_core.dart';

import 'database.dart';
import 'table.dart';

@immutable
abstract class DatabaseCommand<ENTITY extends Entity<MODEL>,
    MODEL extends Model> implements Command<Object> {
  Database get database;
  Table<ENTITY> get table;

  const DatabaseCommand();
}
