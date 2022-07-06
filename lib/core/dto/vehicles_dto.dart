import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/vehicle_model.dart';

class VehiclesDTO extends ResponseDTO {
  int? count;
  String? next;
  String? previous;
  List<Vehicle>? results;
  VehiclesDTO(super.status, super.message, {this.count, this.next, this.previous, this.results});
}
