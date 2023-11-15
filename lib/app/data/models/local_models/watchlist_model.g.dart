// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watchlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WatchListModelAdapter extends TypeAdapter<WatchListModel> {
  @override
  final int typeId = 0;

  @override
  WatchListModel read(BinaryReader reader) {
    final int numOfFields = reader.readByte();
    final Map<int, dynamic> fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WatchListModel()
      ..companyName = fields[0] as String
      ..sharePrice = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, WatchListModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.companyName)
      ..writeByte(1)
      ..write(obj.sharePrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WatchListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
