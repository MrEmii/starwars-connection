import 'package:starwars_connection/core/abstracts/server_repository.dart';
import 'package:starwars_connection/core/usecases/get_peoples.dart';

abstract class PeoplesRepository extends ServerRepository with GetPeoples{
  PeoplesRepository(super.consumer);
}