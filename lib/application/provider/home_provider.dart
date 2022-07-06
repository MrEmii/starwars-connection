import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_connection/application/repositories/people_repository_impl.dart';
import 'package:starwars_connection/core/models/person_model.dart';

class HomeProvider extends ChangeNotifier {
  String? lastPeoples;
  final List<People> _peoples = [];

  List<People> get peoples => _peoples;

  Future<void> fetchPeoples() async {
    _peoples.addAll((await GetIt.I<PeopleRepositoryImpl>().getPeople(url: lastPeoples ?? "https://swapi.dev/api/people")).results ?? []);
    notifyListeners();
  }

  void notify() {
    notifyListeners();
  }
}
