import 'package:hive_flutter/hive_flutter.dart';
import 'package:starwars_connection/application/persistent/adapters/person_adapter.dart';
import 'package:starwars_connection/core/abstracts/entity.dart';
import 'package:starwars_connection/core/entity/person_sighted_entity.dart';
import 'package:starwars_connection/core/entity/user_entity.dart';
import 'package:starwars_connection/core/repositories/persistent_repository.dart';

class HiveDB extends PersistentRepository {
  HiveDB._();

  static final db = HiveDB._();

  final String _peoplePath = "people_collection";
  late Box<PersonShigted>? _peopleBox;

  final String _userPath = "user_collection";
  late Box<dynamic>? _userBox;

  Future<List<PersonShigted>> get _people async {
    if (_peopleBox == null || !Hive.isBoxOpen(_peoplePath)) {
      return (await _deployPeople()).values.toList();
    }
    return _peopleBox!.values.toList();
  }

  Future<User> get user async {
    User? user;
    if (_userBox == null || !Hive.isBoxOpen(_userPath)) {
      user = User.fromMap(Map<String, dynamic>.from((await _deployUser()).toMap()));
    }

    user ??= User.fromMap(Map<String, dynamic>.from(_userBox!.toMap()));
    return user;
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());
  }

  Future<Box<PersonShigted>> _deployPeople() async {
    if (_peopleBox == null || !await Hive.boxExists(_peoplePath) || !Hive.isBoxOpen(_peoplePath)) {
      return _peopleBox = await Hive.openBox<PersonShigted>(_peoplePath);
    }

    return _peopleBox = Hive.box(_peoplePath);
  }

  Future<Box<dynamic>> _deployUser() async {
    if (_userBox == null || !await Hive.boxExists(_userPath) || !Hive.isBoxOpen(_userPath)) {
      return _userBox = await Hive.openBox<dynamic>(_userPath);
    }

    return _userBox = Hive.box(_userPath);
  }

  @override
  Future<void> delete(Entity entity) async {
    if (entity is PersonShigted) {
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
  Future<void> save(Entity entity) async {
    if (entity is PersonShigted) {
      return _peopleBox!.put(entity.id, entity);
    }
    if (entity is User) {
      entity.toMap().forEach((key, value) {
        _userBox!.put(key, value);
      });
      return;
    }
  }
}
