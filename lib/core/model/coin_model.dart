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
  @HiveField(3)
  final CoinHistory? coinHistory;
  @HiveField(4)
  const Coin({this.name, this.fullName, this.imagePath, this.coinHistory});
}

@HiveType(typeId: 1)
class CoinHistory {
  @HiveField(0)
  final int? timeFrom;
  @HiveField(1)
  final int? timeTo;
  @HiveField(2)
  final List<PriceData>? priceData;
  const CoinHistory({
    this.timeFrom,
    this.timeTo,
    this.priceData,
  });
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
