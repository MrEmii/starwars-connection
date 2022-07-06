import 'package:starwars_connection/core/dto/starships_dto.dart';

mixin GetStarships {
  Future<StarshipsDTO> getStarship({required String url});
}
