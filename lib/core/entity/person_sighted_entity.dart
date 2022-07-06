import 'dart:convert';

import 'package:starwars_connection/core/abstracts/entity.dart';
import 'package:starwars_connection/core/models/person_model.dart';

class PersonSighted extends Entity {
  final DateTime date;
  final Person? person;

  const PersonSighted({
    required super.id,
    required this.date,
    required this.person,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'person': person?.toMap(),
    };
  }

  factory PersonSighted.fromMap(Map<String, dynamic> map) {
    return PersonSighted(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      person: map['person'] != null ? Person.fromMap(map['person'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonSighted.fromJson(String source) => PersonSighted.fromMap(json.decode(source) as Map<String, dynamic>);
}
