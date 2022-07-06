import 'package:flutter/foundation.dart';
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
  Box<PersonSighted>? peopleBox;

  final String _userPath = "user_collection";
  Box<dynamic>? userBox;

  ValueListenable<Box<PersonSighted>> get peopleBoxListener => peopleBox!.listenable();

  Future<List<PersonSighted>> get _people async {
    if (peopleBox == null || !Hive.isBoxOpen(_peoplePath)) {
      peopleBox = (await _deployPeople());

      return peopleBox?.values.toList() ?? [];
    }
    return peopleBox!.values.toList();
  }

  Future<User> get user async {
    Map<String, dynamic>? data;
    if (userBox == null || !Hive.isBoxOpen(_userPath)) {
      data = Map<String, dynamic>.from((await _deployUser()).toMap());
    }

    data ??= Map<String, dynamic>.from(userBox!.toMap());

    if (data.isEmpty) {
      User user = User(id: "1", hasConnection: false);
      await save(user);
      return user;
    }

    return User.fromMap(data);
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(PersonAdapter());
    await _deployPeople();
    await _deployUser();
  }

  Future<Box<PersonSighted>> _deployPeople() async {
    if (peopleBox == null || !await Hive.boxExists(_peoplePath) || !Hive.isBoxOpen(_peoplePath)) {
      return peopleBox = await Hive.openBox<PersonSighted>(_peoplePath);
    }

    return peopleBox = Hive.box(_peoplePath);
  }

  Future<Box<dynamic>> _deployUser() async {
    if (userBox == null || !await Hive.boxExists(_userPath) || !Hive.isBoxOpen(_userPath)) {
      return userBox = await Hive.openBox<dynamic>(_userPath);
    }

    return userBox = Hive.box(_userPath);
  }

  @override
  Future<void> delete(Entity entity) async {
    if (entity is PersonSighted) {
      await peopleBox!.delete(entity.id);
    }
  }

  @override
  Future<void> deleteAll() async {
    return peopleBox?.deleteFromDisk();
  }

  @override
  Future<List<T>> getAll<T extends Entity>() async {
    if (T == PersonSighted) {
      return _people as Future<List<T>>;
    }
    return [];
  }

  @override
  Future<void> save(Entity entity) async {
    if (entity is PersonSighted) {
      await peopleBox!.put(entity.id, entity);
      await peopleBox!.flush();
    }
    if (entity is User) {
      entity.toMap().forEach((key, value) {
        userBox!.put(key, value);
      });
      return;
    }
  }
}
