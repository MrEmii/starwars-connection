import 'dart:convert';

import 'package:starwars_connection/core/abstracts/entity.dart';
import 'package:starwars_connection/core/models/person_model.dart';

class PersonShigted extends Entity {
  final DateTime date;
  final Person? people;

  const PersonShigted({
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

  factory PersonShigted.fromMap(Map<String, dynamic> map) {
    return PersonShigted(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      people: map['people'] != null ? Person.fromMap(map['people'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PersonShigted.fromJson(String source) => PersonShigted.fromMap(json.decode(source) as Map<String, dynamic>);
}
