import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:starwars_connection/core/models/person_model.dart';
import 'package:starwars_connection/presentation/ui/skeleton.dart';

class PersonCard extends StatelessWidget {
  final int index;
  final Person person;

  const PersonCard({super.key, required this.person, required this.index});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: person.name.isEmpty ? const Skeleton() : GestureDetector(
          onTap: (() => context.push("/detail/$index")),
          child: Container(
            height: 100,
            decoration: const BoxDecoration(
              image: DecorationImage(image: ResizeImage(AssetImage("assets/images/space.jpg"), width: 183, height: 78), fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      person.name,
                      style: textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      person.gender,
                      style: textTheme.headline6?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
