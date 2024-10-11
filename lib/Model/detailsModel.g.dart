// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsModelAdapter extends TypeAdapter<DetailsModel> {
  @override
  final int typeId = 1;

  @override
  DetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsModel(
      characters: (fields[0] as List).cast<CharacterModel>(),
      conclusion: fields[1] as String,
      status: fields[2] as String,
      rating: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.characters)
      ..writeByte(1)
      ..write(obj.conclusion)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
