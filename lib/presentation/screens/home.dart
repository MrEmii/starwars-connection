import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/provider/home_provider.dart';
import 'package:starwars_connection/presentation/ui/home/option.dart';
import 'package:starwars_connection/presentation/ui/home/people.dart';
import 'package:starwars_connection/presentation/ui/home/people_sighted.dart';
import 'package:starwars_connection/presentation/ui/home/title.dart';
import 'package:starwars_connection/presentation/ui/noglow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    final provider = Provider.of<HomeProvider>(context, listen: false);

    if (provider.lastPeople != null && provider.lastPeople!.count! > provider.people.length && _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      await provider.fetchPeople();
      if (mounted) provider.notify();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: RefreshIndicator(
        onRefresh: () async {
          final provider = Provider.of<HomeProvider>(context, listen: false);
          provider.people.clear();
          provider.lastPeople = null;
          await provider.fetchPeople();
          if (mounted) provider.notify();
        },
        child: ScrollConfiguration(
          behavior: const NoGlowBehaviour(),
          child: ListView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: const [
              HomeOptions(),
              HomeTitle(title: "Personajes avistados"),
              PeopleSightedList(),
              HomeTitle(title: "Personajes de StarWars"),
              PeopleList()
            ],
          ),
        ),
      ),
    );
  }
}
