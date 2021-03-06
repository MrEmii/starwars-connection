import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Person extends Equatable {
  final String name;
  final String height;
  final String mass;
  final String hair;
  final String skin;
  final String eye;
  final String birthYear;
  final String gender;
  final String homeworld;
  final List<String> vehicles;
  final List<String> starships;

  const Person({
    required this.name,
    required this.height,
    required this.mass,
    required this.hair,
    required this.skin,
    required this.eye,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.vehicles,
    required this.starships,
  });

  factory Person.placeholder() => const Person(name: "", height: "", mass: "", hair: "", skin: "", eye: "", birthYear: "", gender: "", homeworld: "", vehicles: [], starships: []);

  Person copyWith({
    String? name,
    String? height,
    String? mass,
    String? hair,
    String? skin,
    String? eye,
    String? birthYear,
    String? gender,
    String? homeworld,
    List<String>? vehicles,
    List<String>? starships,
  }) {
    return Person(
      name: name ?? this.name,
      height: height ?? this.height,
      mass: mass ?? this.mass,
      hair: hair ?? this.hair,
      skin: skin ?? this.skin,
      eye: eye ?? this.eye,
      birthYear: birthYear ?? this.birthYear,
      gender: gender ?? this.gender,
      homeworld: homeworld ?? this.homeworld,
      vehicles: vehicles ?? this.vehicles,
      starships: starships ?? this.starships,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'height': height,
      'mass': mass,
      'hair_color': hair,
      'skin_color': skin,
      'eye_color': eye,
      'birth_year': birthYear,
      'gender': gender,
      'homeworld': homeworld,
      'vehicles': vehicles,
      'starships': starships,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'] as String,
      height: map['height'] as String,
      mass: map['mass'] as String,
      hair: map['hair_color'] as String,
      skin: map['skin_color'] as String,
      eye: map['eye_color'] as String,
      birthYear: map['birth_year'] as String,
      gender: map['gender'] as String,
      homeworld: map['homeworld'] as String,
      vehicles: List<String>.from(map['vehicles']),
      starships: List<String>.from(map['starships']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Person(name: $name, height: $height, mass: $mass, hair: $hair, skin: $skin, eye: $eye, birthYear: $birthYear, gender: $gender, homeworld: $homeworld, vehicles: $vehicles, starships: $starships)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Person && other.name == name && other.height == height && other.mass == mass && other.hair == hair && other.skin == skin && other.eye == eye && other.birthYear == birthYear && other.gender == gender && other.homeworld == homeworld && listEquals(other.vehicles, vehicles) && listEquals(other.starships, starships);
  }

  @override
  int get hashCode {
    return name.hashCode ^ height.hashCode ^ mass.hashCode ^ hair.hashCode ^ skin.hashCode ^ eye.hashCode ^ birthYear.hashCode ^ gender.hashCode ^ homeworld.hashCode ^ vehicles.hashCode ^ starships.hashCode;
  }

  @override
  List<Object?> get props => [name];
}
