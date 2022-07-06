import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_connection/application/repositories/people_repository_impl.dart';
import 'package:starwars_connection/core/dto/people_dto.dart';
import 'package:starwars_connection/core/models/person_model.dart';

class HomeProvider extends ChangeNotifier {
  PeopleDTO? lastPeople;
  final List<Person> _people = [];

  List<Person> get people => _people;

  Future<void> fetchPeople() async {
    int count = (people.length + 10).clamp(people.length, lastPeople?.count ?? 10);
    _people.addAll(List.generate(count, (index) => Person.placeholder()));
    notify();
    lastPeople = await GetIt.I<PeopleRepositoryImpl>().getPeople(url: lastPeople?.next ?? "https://swapi.dev/api/people");
    _people.replaceRange(_people.length - count, _people.length, lastPeople?.results ?? []);
    notify();
  }

  void notify() {
    notifyListeners();
  }
}
