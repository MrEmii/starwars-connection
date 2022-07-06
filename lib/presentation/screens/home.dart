import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:starwars_connection/application/repositories/peoples_repository_impl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _peoples = [];

  @override
  void initState() {
    GetIt.I<PeopleRepositoryImpl>().execute(url: "https://swapi.dev/api/people?format=json").then((value) {
      setState(() {
        _peoples.addAll(value.results ?? []);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: _peoples.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_peoples[index].name),
            );
          },
        ),
      ),
    );
  }
}
