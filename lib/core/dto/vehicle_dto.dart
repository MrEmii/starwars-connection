import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/vehicle_model.dart';

class VehicleDTO extends ResponseDTO {
  Vehicle? result;
  VehicleDTO(super.status, super.message, {this.result});
}
