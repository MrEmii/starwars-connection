import 'package:flutter/material.dart';
import 'package:starwars_connection/application/application.dart';
import 'package:starwars_connection/application/injector.dart';
import 'package:starwars_connection/application/services/injector_services.dart';

void main() {
  setupGetIt();
  runApp(const Injector(child: Application()));
}
