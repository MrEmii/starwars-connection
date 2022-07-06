// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:starwars_connection/core/abstracts/entity.dart';
import 'package:starwars_connection/core/models/person_model.dart';

class PersonSighted extends Entity {
  final DateTime date;
  final People? people;

  const PersonSighted({
    required super.id,
    required this.date,
    required this.people,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.millisecondsSinceEpoch,
      'people': people?.toMap(),
    };
  }

  factory PersonSighted.fromMap(Map<String, dynamic> map) {
    return PersonSighted(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      people: map['people'] != null ? People.fromMap(map['people'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonSighted.fromJson(String source) => PersonSighted.fromMap(json.decode(source) as Map<String, dynamic>);
}
