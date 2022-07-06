import 'package:equatable/equatable.dart';

abstract class Entity extends Equatable {
  final String id;

  const Entity({required this.id});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Entity && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  List<Object?> get props => [id];
}
