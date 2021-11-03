import 'package:zam_core/zam_core.dart';

@immutable
class Table<ENTITY extends Entity> with EquatableMixin {
  final String name;
  final Serialize<ENTITY> serialize;
  final Deserialize<ENTITY> createEntity;

  @override
  get props => [name];

  const Table({
    required this.name,
    required this.serialize,
    required this.createEntity,
  });
}
