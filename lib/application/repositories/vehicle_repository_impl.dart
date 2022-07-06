import 'dart:convert';

import 'package:starwars_connection/core/dto/vehicle_dto.dart';
import 'package:starwars_connection/core/models/vehicle_model.dart';
import "package:http/http.dart" as http;
import 'package:starwars_connection/core/repositories/vehicle_repository.dart';

class VehicleRepositoryImpl extends VehicleRepository {
  VehicleRepositoryImpl(super.consumer);

  @override
  Future<VehicleDTO> getVehicle({required String url}) async {
    http.Response? response = await consumer.get(url: url);

    if (response == null) {
      return VehicleDTO(500, "Error interno.");
    }

    if (response.statusCode != 200) {
      return VehicleDTO(response.statusCode, "Hubo un error al buscar el vehiculo.");
    }
    final Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return VehicleDTO(
      response.statusCode,
      "Vehiculo encontrada con éxito.",
      result: Vehicle.fromMap(Map<String, dynamic>.from(decodedResponse)),
    );
  }
}
