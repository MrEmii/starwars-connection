import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/people_model.dart';

class PeoplesDTO extends DTO<List<People>> {
  PeoplesDTO(super.status, super.message, {super.count, super.next, super.previous, super.results});
}
