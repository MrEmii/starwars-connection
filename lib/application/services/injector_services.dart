import 'package:get_it/get_it.dart';
import 'package:starwars_connection/application/consumer/http_consumer.dart';
import 'package:starwars_connection/application/repositories/people_repository_impl.dart';
import 'package:starwars_connection/application/repositories/planet_repository_impl.dart';
import 'package:starwars_connection/application/repositories/starship_repository_impl.dart';
import 'package:starwars_connection/application/repositories/vehicle_repository_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  HttpConsumer consumer = HttpConsumer();

  getIt.registerLazySingleton<PeopleRepositoryImpl>(() => PeopleRepositoryImpl(consumer));
  getIt.registerLazySingleton<VehicleRepositoryImpl>(() => VehicleRepositoryImpl(consumer));
  getIt.registerLazySingleton<StarshipRepositoryImpl>(() => StarshipRepositoryImpl(consumer));
  getIt.registerLazySingleton<PlanetRepositoryImpl>(() => PlanetRepositoryImpl(consumer));
}
