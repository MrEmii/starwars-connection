import 'dart:convert';

import 'package:starwars_connection/core/dto/starship_dto.dart';
import 'package:starwars_connection/core/models/starship_model.dart';
import 'package:starwars_connection/core/repositories/startship_repository.dart';
import "package:http/http.dart" as http;

class StarshipRepositoryImpl extends StarshipRepository {
  StarshipRepositoryImpl(super.consumer);

  @override
  Future<StarshipDTO> getStarship({required String url}) async {
    http.Response? response = await consumer.get(url: url);

    if (response == null) {
      return StarshipDTO(500, "Error interno.");
    }

    if (response.statusCode != 200) {
      return StarshipDTO(response.statusCode, "Hubo un error al buscar la nave.");
    }
    final Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return StarshipDTO(
      response.statusCode,
      "Nave encontrada con éxito.",
      result: Starship.fromMap(Map<String, dynamic>.from(decodedResponse)),
    );
  }
}
