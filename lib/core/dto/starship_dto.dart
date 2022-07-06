import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/starship_model.dart';

class StarshipDTO extends ResponseDTO {
  Starship? result;
  StarshipDTO(super.status, super.message, {this.result});
}
