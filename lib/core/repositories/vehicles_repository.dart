import 'package:starwars_connection/core/abstracts/server_repository.dart';
import 'package:starwars_connection/core/usecases/get_vehicles.dart';

abstract class VehiclesRepository extends ServerRepository with GetVehicles{
  VehiclesRepository(super.consumer);
}