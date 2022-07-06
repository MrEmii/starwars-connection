import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/person_model.dart';

class PeopleDTO extends ResponseDTO {
  int? count;
  String? next;
  String? previous;
  List<People>? results;
  PeopleDTO(super.status, super.message, {this.count, this.next, this.previous, this.results});
}
