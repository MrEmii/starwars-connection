import 'package:starwars_connection/core/abstracts/entity.dart';

abstract class PersistentRepository {
  Future<void> init();
  Future<void> save(Entity entity);
  Future<void> delete(Entity entity);
  Future<void> deleteAll();
  Future<List<Entity>> getAll();
}
