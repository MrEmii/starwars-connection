import 'package:hive_flutter/hive_flutter.dart';
import 'package:starwars_connection/application/persistent/adapters/person_adapter.dart';
import 'package:starwars_connection/core/abstracts/entity.dart';
import 'package:starwars_connection/core/models/person_sighted_model.dart';
import 'package:starwars_connection/core/repositories/persistent_repository.dart';

class HiveDB extends PersistentRepository {
  HiveDB._();

  static final db = HiveDB._();

  final String _peoplePath = "people_collection";
  late Box<PersonSighted>? _peopleBox;

  Future<List<PersonSighted>> get _people async {
    if (_peopleBox == null || !Hive.isBoxOpen(_peoplePath)) {
      return (await _deploy()).values.toList();
    }
    return _peopleBox!.values.toList();
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());
  }

  Future<Box<PersonSighted>> _deploy() async {
    if (_peopleBox == null || !await Hive.boxExists(_peoplePath) || !Hive.isBoxOpen(_peoplePath)) {
      return _peopleBox = await Hive.openBox<PersonSighted>(_peoplePath);
    }

    return _peopleBox = Hive.box(_peoplePath);
  }

  @override
  Future<void> delete(Entity entity) async {
    if (entity is PersonSighted) {
      await _peopleBox!.delete(entity.id);
    }
  }

  @override
  Future<void> deleteAll() async {
    return _peopleBox?.deleteFromDisk();
  }

  @override
  Future<List<Entity>> getAll() async {
    return _people;
  }

  @override
  Future<void> save(Entity entity) {
    if (entity is PersonSighted) {
      return _peopleBox!.put(entity.id, entity);
    }
    return Future.value();
  }
}
