import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/provider/home_provider.dart';
import 'package:starwars_connection/presentation/ui/loading.dart';
import 'package:starwars_connection/presentation/ui/tfbwy.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late HomeProvider _homeProvider;
  late bool _isLoading = true;

  @override
  void initState() {
    _homeProvider = context.read<HomeProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _homeProvider.fetchPeople();
      setState(() {
        _isLoading = false;
      });

      Future.delayed(const Duration(seconds: 2), () {
        context.go("/");
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: _isLoading
              ? const [
                  Loading(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 50),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CircularProgressIndicator(),
                    ),
                  )
                ]
              : const [
                  TheForceBeWithYou(),
                ],
        ),
      ),
    );
  }
}
