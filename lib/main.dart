import 'package:flutter/material.dart';
import 'package:starwars_connection/application/application.dart';
import 'package:starwars_connection/application/injector.dart';
import 'package:starwars_connection/application/persistent/hive_db.dart';
import 'package:starwars_connection/application/services/injector_services.dart';

void main() async {
  await HiveDB.db.init();
  setupGetIt();
  runApp(const Injector(child: Application()));
}
