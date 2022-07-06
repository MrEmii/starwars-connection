import 'package:starwars_connection/core/abstracts/dto.dart';

class PostPersonSightedDTO extends RequestDTO {
  final String userId;
  final DateTime dateTime;
  final String characterName;

  PostPersonSightedDTO(this.userId, this.dateTime, this.characterName);

  @override
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'dateTime': dateTime.toIso8601String(),
      'character_name': characterName,
    };
  }
}

class PersonSightedDTO extends ResponseDTO {
  String? userId;
  DateTime? dateTime;
  String? characterName;

  PersonSightedDTO(super.status, super.message, {this.userId, this.dateTime, this.characterName});
}
