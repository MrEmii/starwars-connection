import 'package:starwars_connection/core/dto/people_dto.dart';

mixin GetPeople {
  Future<PeopleDTO> getPeople({required String url});
}
