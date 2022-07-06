import 'package:starwars_connection/core/dto/person_sighted_dto.dart';
import 'package:starwars_connection/core/models/person_sighted_model.dart';

mixin PostPerson {
  Future<PersonSightedDTO?> postPerson({required String url, required PostPersonSightedDTO dto});
}
