import 'package:hive/hive.dart';
import 'package:starwars_connection/core/models/person_sighted_model.dart';

class PersonAdapter extends TypeAdapter<PersonSighted> {
  @override
  PersonSighted read(BinaryReader reader) {
    return PersonSighted.fromJson(reader.read());
  }

  @override
  int get typeId => 1;

  @override
  int get hashCode => typeId.hashCode;

  @override
  void write(BinaryWriter writer, obj) {
    writer.write(obj.toJson());
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
