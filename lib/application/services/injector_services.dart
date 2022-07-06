import 'package:get_it/get_it.dart';
import 'package:starwars_connection/application/consumer/http_consumer.dart';
import 'package:starwars_connection/application/repositories/peoples_repository_impl.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  HttpConsumer consumer = HttpConsumer();

  getIt.registerLazySingleton<PeopleRepositoryImpl>(() => PeopleRepositoryImpl(consumer));
}
