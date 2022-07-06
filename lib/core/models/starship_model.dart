import 'dart:convert';

import 'package:equatable/equatable.dart';

class Startship extends Equatable {
  final String name;
  final String model;
  final String manufacturer;
  final String type;
  final String url;

  const Startship({
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.type,
    required this.url,
  });

  Startship copyWith({
    String? name,
    String? model,
    String? manufacturer,
    String? type,
    String? url,
  }) {
    return Startship(
      name: name ?? this.name,
      model: model ?? this.model,
      manufacturer: manufacturer ?? this.manufacturer,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'model': model,
      'manufacturer': manufacturer,
      'starship_class': type,
      'url': url,
    };
  }

  factory Startship.fromMap(Map<String, dynamic> map) {
    return Startship(
      name: map['name'] as String,
      model: map['model'] as String,
      manufacturer: map['manufacturer'] as String,
      type: map['starship_class'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Startship.fromJson(String source) => Startship.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Startship(name: $name, model: $model, manufacturer: $manufacturer, starship_class: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Startship && other.name == name && other.model == model && other.manufacturer == manufacturer && other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^ model.hashCode ^ manufacturer.hashCode ^ type.hashCode;
  }

  @override
  List<Object?> get props => [name];
}
