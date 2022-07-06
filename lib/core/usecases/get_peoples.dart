import 'package:starwars_connection/core/dto/peoples_dto.dart';

mixin GetPeoples {
  Future<PeoplesDTO> execute({required String url});
}
