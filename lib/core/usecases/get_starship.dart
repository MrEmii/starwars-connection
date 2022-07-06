import 'package:starwars_connection/core/dto/starship_dto.dart';

mixin GetStarship {
  Future<StarshipDTO> getStarship({required String url});
}
