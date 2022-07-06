// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:starwars_connection/core/abstracts/entity.dart';

class User extends Entity {
  final bool hasConnection;

  const User({required super.id, required this.hasConnection});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hasConnection': hasConnection,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      hasConnection: map['hasConnection'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    bool? hasConnection,
  }) {
    return User(
      id: id,
      hasConnection: hasConnection ?? this.hasConnection,
    );
  }
}
