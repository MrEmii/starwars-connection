import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/presentation/theme.dart';

class PersonCard extends StatelessWidget {
  final Person person;

  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: GestureDetector(
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/images/space.jpg"), fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    person.name,
                    style: textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
