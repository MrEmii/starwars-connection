import 'package:get_it/get_it.dart';
import 'package:starwars_connection/application/consumer/http_consumer.dart';
import 'package:starwars_connection/application/persistent/hive_db.dart';
import 'package:starwars_connection/application/repositories/people_repository_impl.dart';
import 'package:starwars_connection/application/repositories/planet_repository_impl.dart';
import 'package:starwars_connection/application/repositories/starship_repository_impl.dart';
import 'package:starwars_connection/application/repositories/vehicle_repository_impl.dart';
import 'package:starwars_connection/core/repositories/people_repository.dart';
import 'package:starwars_connection/core/repositories/persistent_repository.dart';
import 'package:starwars_connection/core/repositories/planet_repository.dart';
import 'package:starwars_connection/core/repositories/startship_repository.dart';
import 'package:starwars_connection/core/repositories/vehicle_repository.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  HttpConsumer consumer = HttpConsumer();

  getIt.registerLazySingleton<PeopleRepository>(() => PeopleRepositoryImpl(consumer));
  getIt.registerLazySingleton<VehicleRepository>(() => VehicleRepositoryImpl(consumer));
  getIt.registerLazySingleton<StarshipRepository>(() => StarshipRepositoryImpl(consumer));
  getIt.registerLazySingleton<PlanetRepository>(() => PlanetRepositoryImpl(consumer));
}
