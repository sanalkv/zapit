// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinAdapter extends TypeAdapter<Coin> {
  @override
  final int typeId = 0;

  @override
  Coin read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Coin(
      name: fields[0] as String?,
      fullName: fields[1] as String?,
      imagePath: fields[2] as String?,
      coinHistory: fields[3] as CoinHistory?,
    );
  }

  @override
  void write(BinaryWriter writer, Coin obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.coinHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CoinHistoryAdapter extends TypeAdapter<CoinHistory> {
  @override
  final int typeId = 1;

  @override
  CoinHistory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinHistory(
      timeFrom: fields[0] as int?,
      timeTo: fields[1] as int?,
      priceData: (fields[2] as List?)?.cast<PriceData>(),
    );
  }

  @override
  void write(BinaryWriter writer, CoinHistory obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timeFrom)
      ..writeByte(1)
      ..write(obj.timeTo)
      ..writeByte(2)
      ..write(obj.priceData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinHistoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PriceDataAdapter extends TypeAdapter<PriceData> {
  @override
  final int typeId = 2;

  @override
  PriceData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PriceData(
      time: fields[0] as int?,
      price: fields[1] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, PriceData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
