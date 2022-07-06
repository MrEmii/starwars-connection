import 'package:hive/hive.dart';

class PersonAdapter extends TypeAdapter {
  @override
  read(BinaryReader reader) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  int get typeId => 1;

  @override
  int get hashCode => typeId.hashCode;

  @override
  void write(BinaryWriter writer, obj) {
    // TODO: implement write
  }

  @override
  bool operator ==(Object other) => identical(this, other) || other is PersonAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
