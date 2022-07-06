import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/vehicle_model.dart';

class VehiclesDTO extends DTO<List<Vehicle>> {
  VehiclesDTO(super.status, super.message, {super.count, super.next, super.previous, super.results});
}
