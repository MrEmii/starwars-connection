import 'package:starwars_connection/core/abstracts/server_repository.dart';
import 'package:starwars_connection/core/usecases/get_vehicle.dart';

abstract class VehicleRepository extends ServerRepository with GetVehicle{
  VehicleRepository(super.consumer);
}