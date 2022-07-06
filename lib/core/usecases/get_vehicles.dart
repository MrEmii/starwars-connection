import 'package:starwars_connection/core/dto/vehicles_dto.dart';

mixin GetVehicles {
  Future<VehiclesDTO> getVehicles({required String url});
}
