import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_connection/application/provider/home_provider.dart';
import 'package:starwars_connection/application/repositories/planet_repository_impl.dart';
import 'package:starwars_connection/application/repositories/starship_repository_impl.dart';
import 'package:starwars_connection/application/repositories/vehicle_repository_impl.dart';
import 'package:starwars_connection/core/dto/planet_dto.dart';
import 'package:starwars_connection/core/dto/starship_dto.dart';
import 'package:starwars_connection/core/dto/vehicle_dto.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/core/models/planet_model.dart';
import 'package:starwars_connection/core/models/starship_model.dart';
import 'package:starwars_connection/core/models/vehicle_model.dart';

class DetailProvider extends ChangeNotifier {
  DetailProvider(this.homeProvider);

  HomeProvider? homeProvider;
  Person? person;
  List<Vehicle>? vehicles;
  List<Starship>? starships;
  Planet? planet;

  DetailProvider from(HomeProvider? provider) {
    homeProvider = provider;
    return this;
  }

  Person setPerson(int index) {
    person = homeProvider!.people[index];
    // notify();
    return person!;
  }

  Future<void> fetchVehicles() async {
    if (person != null) {
      List<VehicleDTO> dtos = await Future.wait(person!.vehicles.map((vehicle) => GetIt.I<VehicleRepositoryImpl>().getVehicle(url: vehicle)));
      if (dtos.any((element) => element.status != 200)) {
        throw Exception('Error fetching vehicles');
      }

      vehicles = dtos.map((dto) => dto.result!).toList();
    }
  }

  Future<void> fetchStarships() async {
    if (person != null) {
      List<StarshipDTO> dtos = await Future.wait(person!.starships.map((starship) => GetIt.I<StarshipRepositoryImpl>().getStarship(url: starship)));

      if (dtos.any((element) => element.status != 200)) {
        throw Exception('Error fetching starships');
      }

      starships = dtos.map((dto) => dto.result!).toList();
    }
  }

  Future<void> fetchPlanet() async {
    if (person != null) {
      PlanetDTO dto = await GetIt.I<PlanetRepositoryImpl>().getPlanet(url: person!.homeworld);
      if (dto.status != 200) {
        throw Exception('Error fetching planet');
      }

      planet = dto.result;
    }
  }

  void notify() {
    notifyListeners();
  }

  void clear() {
    person = null;
    vehicles = null;
    starships = null;
  }
}
