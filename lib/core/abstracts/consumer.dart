import 'package:starwars_connection/core/abstracts/dto.dart';

abstract class Consumer<T> {
  Future<T?> fetch({required String url});
}
