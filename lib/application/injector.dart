import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/provider/detail_provider.dart';
import 'package:starwars_connection/application/provider/home_provider.dart';
import 'package:starwars_connection/application/provider/menu_provider.dart';

class Injector extends StatelessWidget {
  final Widget child;

  const Injector({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
        ChangeNotifierProvider<MenuProvider>(create: (context) => MenuProvider()),
        ChangeNotifierProxyProvider<HomeProvider, DetailProvider>(create: (_) => DetailProvider(null), update: (_, home, detail) => detail?.from(home) ?? DetailProvider(home)),
      ],
      child: child,
    );
  }
}
