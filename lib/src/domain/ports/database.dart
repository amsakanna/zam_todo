import 'package:zam_core/zam_core.dart';

import 'table.dart';

abstract class Database {
  Future<void> initialize(List<Table> table);
  Future<bool> exists<ENTITY extends Entity>(Table<ENTITY> table, String key);
  Future<ENTITY> get<ENTITY extends Entity>(Table<ENTITY> table, String key);
  Future<Iterable<ENTITY>> getAll<ENTITY extends Entity>(Table<ENTITY> table);
  Stream<Iterable<ENTITY>> streamAll<ENTITY extends Entity>(
      Table<ENTITY> table);
  Future<ENTITY> add<ENTITY extends Entity>(Table<ENTITY> table, ENTITY data);
  Future<ENTITY> update<ENTITY extends Entity>(
      Table<ENTITY> table, ENTITY data);
  Future<ENTITY> remove<ENTITY extends Entity>(Table<ENTITY> table, String key);
}
