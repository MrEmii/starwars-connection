import 'package:flutter/material.dart';
import 'package:starwars_connection/application/router/router.dart';
import 'package:starwars_connection/presentation/theme.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "StarWars Connections",
      routeInformationParser: AppRoutes.parser,
      routerDelegate: AppRoutes.delegate,
      routeInformationProvider: AppRoutes.provider,
      theme: AppTheme.lightTheme,
    );
  }
}
