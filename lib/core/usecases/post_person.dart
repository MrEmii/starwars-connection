import 'package:starwars_connection/core/dto/person_sighted_dto.dart';
mixin PostPerson {
  Future<PersonSightedDTO?> postPerson({required String url, required PostPersonSightedDTO dto});
}
