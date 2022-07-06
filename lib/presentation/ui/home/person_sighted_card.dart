import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starwars_connection/core/entity/person_sighted_entity.dart';

class PersonSightedCard extends StatelessWidget {
  final PersonSighted sighted;
  const PersonSightedCard({Key? key, required this.sighted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 100,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            sighted.person!.name,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(DateFormat("dd/MM/yyyy").format(sighted.date)),
        ],
      ),
    );
  }
}
