import 'package:starwars_connection/core/abstracts/server_repository.dart';
import 'package:starwars_connection/core/usecases/get_people.dart';
import 'package:starwars_connection/core/usecases/post_person.dart';

abstract class PeopleRepository extends ServerRepository with GetPeople, PostPerson {
  PeopleRepository(super.consumer);
}