import 'dart:convert';

import 'package:starwars_connection/core/dto/planet_dto.dart';
import 'package:starwars_connection/core/models/planet_model.dart';
import 'package:starwars_connection/core/repositories/planet_repository.dart';
import "package:http/http.dart" as http;

class PlanetRepositoryImpl extends PlanetRepository {
  PlanetRepositoryImpl(super.consumer);

  @override
  Future<PlanetDTO> getPlanet({required String url}) async {
    http.Response? response = await consumer.get(url: url);

    if (response == null) {
      return PlanetDTO(500, "Error interno.");
    }

    if (response.statusCode != 200) {
      return PlanetDTO(response.statusCode, "Hubo un error al buscar el planeta.");
    }
    final Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return PlanetDTO(
      response.statusCode,
      "Planeta encontrado con éxito.",
      result: Planet.fromMap(Map<String, dynamic>.from(decodedResponse)),
    );
  }
}
