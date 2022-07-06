import 'package:starwars_connection/core/abstracts/server_repository.dart';
import 'package:starwars_connection/core/usecases/get_planet.dart';

abstract class PlanetRepository extends ServerRepository with GetPlanet {
  PlanetRepository(super.consumer);
}
