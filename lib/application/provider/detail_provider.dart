import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:nanoid/async.dart';
import 'package:starwars_connection/application/persistent/hive_db.dart';
import 'package:starwars_connection/application/provider/home_provider.dart';
import 'package:starwars_connection/application/repositories/people_repository_impl.dart';
import 'package:starwars_connection/application/repositories/planet_repository_impl.dart';
import 'package:starwars_connection/application/repositories/starship_repository_impl.dart';
import 'package:starwars_connection/application/repositories/vehicle_repository_impl.dart';
import 'package:starwars_connection/core/dto/person_sighted_dto.dart';
import 'package:starwars_connection/core/dto/planet_dto.dart';
import 'package:starwars_connection/core/dto/starship_dto.dart';
import 'package:starwars_connection/core/dto/vehicle_dto.dart';
import 'package:starwars_connection/core/entity/person_sighted_entity.dart';
import 'package:starwars_connection/core/entity/user_entity.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/core/models/planet_model.dart';
import 'package:starwars_connection/core/models/starship_model.dart';
import 'package:starwars_connection/core/models/vehicle_model.dart';
import 'package:starwars_connection/core/repositories/people_repository.dart';
import 'package:starwars_connection/core/repositories/planet_repository.dart';
import 'package:starwars_connection/core/repositories/startship_repository.dart';
import 'package:starwars_connection/core/repositories/vehicle_repository.dart';

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
    return person!;
  }

  Future<void> fetchVehicles() async {
    if (person != null) {
      List<VehicleDTO> dtos = await Future.wait(person!.vehicles.map((vehicle) => GetIt.I<VehicleRepository>().getVehicle(url: vehicle)));
      if (dtos.any((element) => element.status != 200)) {
        errorMessage("No se pudieron cargar algunos vehiculos");
      }

      vehicles = dtos.map((dto) => dto.result!).toList();
    }
  }

  Future<void> fetchStarships() async {
    if (person != null) {
      List<StarshipDTO> dtos = await Future.wait(person!.starships.map((starship) => GetIt.I<StarshipRepository>().getStarship(url: starship)));

      if (dtos.any((element) => element.status != 200)) {
        errorMessage("No se pudieron cargar algunas naves");
      }

      starships = dtos.map((dto) => dto.result!).toList();
    }
  }

  Future<void> fetchPlanet() async {
    if (person != null) {
      PlanetDTO dto = await GetIt.I<PlanetRepository>().getPlanet(url: person!.homeworld);
      if (dto.status != 200) {
        errorMessage("No se pudo cargar el planeta");
        return;
      }

      planet = dto.result;
    }
  }

  void errorMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.redAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void notify() {
    notifyListeners();
  }

  void clear() {
    person = null;
    vehicles = null;
    starships = null;
    planet = null;
  }

  Future<void> report() async {
    if (person != null) {
      User user = await HiveDB.db.user;
      if (!user.hasConnection) {
        errorMessage("No tenés conexión");
        return;
      }
      var postPersonSightedDTO = PostPersonSightedDTO(user.id, DateTime.now(), person!.name);
      PersonSightedDTO? dto = await GetIt.I<PeopleRepository>().postPerson(url: "https://jsonplaceholder.typicode.com/posts", dto: postPersonSightedDTO);

      if (dto == null || dto.status != 201) {
        errorMessage(dto?.message ?? "No se pudo reportar");
        return;
      }

      await Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: "${person?.name} avistado con éxito",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.black,
        fontSize: 16.0,
      );

      await HiveDB.db.save(PersonSighted(id: await nanoid(), date: postPersonSightedDTO.dateTime, person: person!));
      notify();
    }
  }
}
