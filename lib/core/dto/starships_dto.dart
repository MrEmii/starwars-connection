import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/starship_model.dart';

class StarshipsDTO extends ResponseDTO {
  int? count;
  String? next;
  String? previous;
  List<Startship>? results;
  StarshipsDTO(super.status, super.message, {this.count, this.next, this.previous, this.results});
}
