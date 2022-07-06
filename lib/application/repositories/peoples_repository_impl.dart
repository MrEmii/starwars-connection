import 'dart:convert';
import 'package:starwars_connection/core/dto/peoples_dto.dart';
import 'package:starwars_connection/core/models/people_model.dart';
import 'package:starwars_connection/core/repositories/peoples_repository.dart';
import "package:http/http.dart" as http;

class PeopleRepositoryImpl extends PeoplesRepository {
  PeopleRepositoryImpl(super.consumer);

  @override
  Future<PeoplesDTO> execute({required String url}) async {
    http.Response? response = await consumer.fetch(url: "$url&format=json");

    if (response == null) {
      return PeoplesDTO(500, "Error interno.");
    }

    if (response.statusCode != 200) {
      return PeoplesDTO(response.statusCode, "Hubo un error al buscar las personas.");
    }
    final Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return PeoplesDTO(
      response.statusCode,
      "Personas encontradas con éxito.",
      count: decodedResponse["count"],
      next: decodedResponse["next"],
      previous: decodedResponse["previous"],
      results: decodedResponse["results"].map<People>((result) => People.fromMap(result)).toList(),
    );
  }
}
