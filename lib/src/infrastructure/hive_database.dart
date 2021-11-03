import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:zam_core/repository.dart';
import 'package:zam_core/rxdart.dart';

import '../domain/ports.dart';

class HiveDatabase implements Database {
  @override
  Future<void> initialize(List<Table> tables) async {
    if (!kIsWeb) {
      final appDirectory = await getApplicationDocumentsDirectory();
      Hive.init(appDirectory.path);
    }

    for (var table in tables) {
      await Hive.openBox(table.name);
    }
  }

  Future<Box> getTableInstance(Table table) {
    return Hive.openBox(table.name);
  }

  @override
  Future<bool> exists<ENTITY extends Entity>(
      Table<ENTITY> table, String key) async {
    final tableInstance = await getTableInstance(table);
    return tableInstance.containsKey(key);
  }

  @override
  Future<ENTITY> get<ENTITY extends Entity>(
      Table<ENTITY> table, String key) async {
    final tableInstance = await getTableInstance(table);
    final data = tableInstance.get(int.parse(key));
    if (data == null) {
      throw 'Database Error: data not found.';
    }
    return table.createEntity({...data, 'key': key.toString()});
  }

  @override
  Future<Iterable<ENTITY>> getAll<ENTITY extends Entity>(
      Table<ENTITY> table) async {
    final tableInstance = await getTableInstance(table);
    return tableInstance.toMap().map((key, data) {
      return MapEntry(
          key, table.createEntity({...data, 'key': key.toString()}));
    }).values;
  }

  @override
  Stream<Iterable<ENTITY>> streamAll<ENTITY extends Entity>(
      Table<ENTITY> table) {
    return getTableInstance(table).asStream().switchMap((tableInstance) {
      return tableInstance.watch().map((event) {
        return tableInstance.toMap().map((key, data) {
          return MapEntry(
              key,
              table.createEntity({
                ...data,
                'key': key.toString(),
              }));
        }).values;
      });
    }).mergeWith([getAll(table).asStream()]);
  }

  @override
  Future<ENTITY> add<ENTITY extends Entity>(
      Table<ENTITY> table, ENTITY data) async {
    final tableInstance = await getTableInstance(table);
    final key = await tableInstance.add(data.toJson());
    final addedData = {
      ...data.toJson(),
      'key': key.toString(),
    };
    await tableInstance.put(key, addedData);
    return table.createEntity(addedData);
  }

  @override
  Future<ENTITY> update<ENTITY extends Entity>(
      Table<ENTITY> table, ENTITY data) async {
    final tableInstance = await getTableInstance(table);
    await tableInstance.put(int.parse(data.key), data.toJson());
    return data;
  }

  @override
  Future<ENTITY> remove<ENTITY extends Entity>(
      Table<ENTITY> table, String key) async {
    final tableInstance = await getTableInstance(table);
    final data = await get(table, key);
    await tableInstance.delete(int.parse(key));
    return data;
  }
}
