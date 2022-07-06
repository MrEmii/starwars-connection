import 'dart:convert';
import 'package:starwars_connection/core/dto/people_dto.dart';
import 'package:starwars_connection/core/dto/person_sighted_dto.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/core/repositories/people_repository.dart';
import "package:http/http.dart" as http;

class PeopleRepositoryImpl extends PeopleRepository {
  PeopleRepositoryImpl(super.consumer);

  @override
  Future<PeopleDTO> getPeople({required String url}) async {
    http.Response? response = await consumer.get(url: url);

    if (response == null) {
      return PeopleDTO(500, "Error interno.");
    }

    if (response.statusCode != 200) {
      return PeopleDTO(response.statusCode, "Hubo un error al buscar las personas.");
    }
    final Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    return PeopleDTO(
      response.statusCode,
      "Personas encontradas con éxito.",
      count: decodedResponse["count"],
      next: decodedResponse["next"],
      previous: decodedResponse["previous"],
      results: decodedResponse["results"].map<Person>((result) => Person.fromMap(result)).toList(),
    );
  }

  @override
  Future<PersonSightedDTO?> postPerson({required String url, required PostPersonSightedDTO dto}) async {
    http.Response? response = await consumer.post(url: url, dto: dto);

    if (response == null) {
      return null;
    }

    if(response.statusCode != 201) {
      return PersonSightedDTO(response.statusCode, "Hubo un error al avistar a la persona.");
    }

    final Map decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return PersonSightedDTO(
      response.statusCode,
      "Personas avistada con éxito.",
      characterName: decodedResponse["character_name"],
      dateTime: DateTime.parse(decodedResponse["dateTime"]),
      userId: decodedResponse["userId"],
    );
  }
}
