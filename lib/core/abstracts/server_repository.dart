import 'package:starwars_connection/core/abstracts/consumer.dart';

abstract class ServerRepository {
  final Consumer consumer;

  ServerRepository(this.consumer);
}