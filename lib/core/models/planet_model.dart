// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Planet extends Equatable {

  final String name;
  final String weather;
  final String terrain;

  const Planet({
    required this.name,
    required this.weather,
    required this.terrain,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'climate': weather,
      'terrain': terrain,
    };
  }

  factory Planet.fromMap(Map<String, dynamic> map) {
    return Planet(
      name: map['name'] as String,
      weather: map['climate'] as String,
      terrain: map['terrain'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Planet.fromJson(String source) => Planet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [name];
}
