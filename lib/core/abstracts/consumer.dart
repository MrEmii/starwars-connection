import 'package:starwars_connection/core/abstracts/dto.dart';

abstract class Consumer<T> {
  Future<T?> get({required String url});
  Future<T?> post({required String url, required RequestDTO dto});
}
