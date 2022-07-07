import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starwars_connection/application/provider/home_provider.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/presentation/ui/home/person_card.dart';

class PeopleList extends StatelessWidget {
  const PeopleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Person> people = context.watch<HomeProvider>().people;
    return ListView.builder(
      itemExtent: 100,
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemCount: people.length,
      itemBuilder: (context, index) {
        return PersonCard(person: people[index], index: index);
      },
    );
  }
}
