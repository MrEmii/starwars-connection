import 'package:starwars_connection/core/abstracts/server_repository.dart';
import 'package:starwars_connection/core/usecases/get_starship.dart';

abstract class StarshipRepository extends ServerRepository with GetStarship{
  StarshipRepository(super.consumer);
}