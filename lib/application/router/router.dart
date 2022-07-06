import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/provider/detail_provider.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/presentation/screens/detail.dart';
import 'package:starwars_connection/presentation/screens/home.dart';
import 'package:starwars_connection/presentation/screens/menu.dart';
import 'package:starwars_connection/presentation/screens/splash.dart';

class AppRoutes {
  static final _router = GoRouter(routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'splash',
          name: 'splash',
          pageBuilder: (context, state) => CustomTransitionPage<void>(
            key: state.pageKey,
            child: const SplashScreen(),
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder: (context, animation, secondaryAnimation, child) => FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: 'detail/:id',
          name: 'detail',
          builder: (context, state) {
            final String id = state.params['id'] as String;
            final int index = int.tryParse(id) ?? 0;
            Person person = context.read<DetailProvider>().setPerson(index);
            return DetailScreen(
              person: person,
            );
          },
        ),
        GoRoute(
          path: "menu",
          name: "menu",
          builder: (context, state) {
            return const MenuScreen();
          },
        )
      ],
    ),
  ], initialLocation: "/splash");

  static get provider => _router.routeInformationProvider;
  static get parser => _router.routeInformationParser;
  static get delegate => _router.routerDelegate;
}
