import 'package:starwars_connection/core/dto/vehicle_dto.dart';

mixin GetVehicle {
  Future<VehicleDTO> getVehicle({required String url});
}
