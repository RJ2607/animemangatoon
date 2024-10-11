// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animeWebToonsModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimeWebToonsModelAdapter extends TypeAdapter<AnimeWebToonsModel> {
  @override
  final int typeId = 0;

  @override
  AnimeWebToonsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimeWebToonsModel(
      title: fields[0] as String,
      image: fields[1] as String,
      url: fields[2] as String,
      description: fields[3] as String,
      creator: fields[4] as String,
      genre: fields[5] as String,
      details: fields[6] as DetailsModel,
    );
  }

  @override
  void write(BinaryWriter writer, AnimeWebToonsModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.url)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.creator)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.details);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimeWebToonsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
