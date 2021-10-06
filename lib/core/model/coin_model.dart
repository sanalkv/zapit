import 'package:hive/hive.dart';

part 'coin_model.g.dart';

@HiveType(typeId: 0)
class Coin {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? fullName;
  @HiveField(2)
  final String? imagePath;
  @HiveField(4)
  const Coin({this.name, this.fullName, this.imagePath});

  Coin copyWith({String? name, String? fullName, String? imagePath, CoinHistory? coinHistory}) {
    return Coin(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      fullName: fullName ?? this.fullName,
    );
  }
}

@HiveType(typeId: 1)
class CoinHistory {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final int? timeFrom;
  @HiveField(2)
  final int? timeTo;
  @HiveField(3)
  final List<PriceData>? priceData;
  const CoinHistory({
    this.name,
    this.timeFrom,
    this.timeTo,
    this.priceData,
  });
  CoinHistory copyWith({String? name, int? timeFrom, int? timeTo, List<PriceData>? priceData}) {
    return CoinHistory(
      name: name ?? this.name,
      timeFrom: timeFrom ?? this.timeFrom,
      timeTo: timeTo ?? this.timeTo,
      priceData: priceData ?? this.priceData,
    );
  }
}

@HiveType(typeId: 2)
class PriceData {
  @HiveField(0)
  final int? time;
  @HiveField(1)
  final double? price;
  const PriceData({
    this.time,
    this.price,
  });
}
