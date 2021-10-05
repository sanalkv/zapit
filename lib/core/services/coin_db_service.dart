import 'package:hive/hive.dart';
import 'package:zapit/core/model/coin_model.dart';

class CoinDBService {
  static final String _boxName = 'coinBox';
  static late Box<Coin> _coinBox;

  static Future<CoinDBService> init() async {
    _coinBox = await Hive.openBox<Coin>(_boxName);
    return CoinDBService();
  }

  Future<List<Coin>> loadCoins() async {
    return _coinBox.values.toList();
  }

  Future<void> storeCoins(List<Coin> coins) async {
    await _coinBox.clear();
    await _coinBox.addAll(coins);
  }

  Future<void> updateCoin(Coin coin) async {}
}
