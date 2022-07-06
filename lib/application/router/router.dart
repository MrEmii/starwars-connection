import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
            final id = state.params['id'];
            //TODO: get detail from api
            return const DetailScreen();
          },
        ),
        GoRoute(
          path: "menu",
          name: "menu",
          builder: (context, state) => const MenuScreen(),
        )
      ],
    ),
  ], initialLocation: "/splash");

  static get provider => _router.routeInformationProvider;
  static get parser => _router.routeInformationParser;
  static get delegate => _router.routerDelegate;
}
