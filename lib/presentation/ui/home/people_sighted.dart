import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:starwars_connection/application/persistent/hive_db.dart';
import 'package:starwars_connection/core/entity/person_sighted_entity.dart';
import 'package:starwars_connection/presentation/ui/home/person_sighted_card.dart';

class PeopleSightedList extends StatelessWidget {
  const PeopleSightedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: size.width,
          height: 100,
          decoration: const BoxDecoration(color: Colors.white12),
          child: ValueListenableBuilder<Box<PersonSighted>>(
            valueListenable: HiveDB.db.peopleBoxListener,
            builder: (context, snapshot, _) {
              final people = snapshot.values.toList()..sort((a, b) => b.date.compareTo(a.date))..reversed;
              if (people.isEmpty) {
                return const Center(
                  child: Text("No hay personajes avistados"),
                );
              }
              return ListView.builder(
                itemCount: people.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PersonSightedCard(sighted: people[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
