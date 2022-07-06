import 'package:starwars_connection/core/abstracts/dto.dart';
import 'package:starwars_connection/core/models/planet_model.dart';

class PlanetDTO extends ResponseDTO {
  Planet? result;
  PlanetDTO(super.status, super.message, {this.result});
}
