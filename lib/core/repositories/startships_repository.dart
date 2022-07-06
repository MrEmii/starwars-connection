import 'package:starwars_connection/core/abstracts/server_repository.dart';
import 'package:starwars_connection/core/usecases/get_starships.dart';

abstract class StarshipsRepository extends ServerRepository with GetStarships{
  StarshipsRepository(super.consumer);
}