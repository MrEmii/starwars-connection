import 'package:starwars_connection/core/dto/planet_dto.dart';

mixin GetPlanet {
  Future<PlanetDTO> getPlanet({required String url});
}
