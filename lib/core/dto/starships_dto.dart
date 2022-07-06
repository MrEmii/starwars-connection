import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/starship_model.dart';

class StarshipsDTO extends DTO<List<Startship>> {
  StarshipsDTO(super.status, super.message, {super.count, super.next, super.previous, super.results});
}
