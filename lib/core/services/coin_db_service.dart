import 'package:hive/hive.dart';
import 'package:zapit/core/model/coin_model.dart';
import 'package:collection/collection.dart';

class CoinDBService {
  static final String _coinsBoxName = 'coinsBox';
  static final String _coinHistoryBoxName = 'coinDetailsBox';
  static late Box<Coin> _coinsBox;
  static late Box<CoinHistory> _coinHistoryBox;

  static Future<CoinDBService> init() async {
    Hive.registerAdapter(CoinAdapter());
    Hive.registerAdapter(CoinHistoryAdapter());
    Hive.registerAdapter(PriceDataAdapter());
    _coinsBox = await Hive.openBox<Coin>(_coinsBoxName);
    _coinHistoryBox = await Hive.openBox<CoinHistory>(_coinHistoryBoxName);
    return CoinDBService();
  }

  Future<List<Coin?>?> loadCoins() async {
    return _coinsBox.values.toList();
  }

  Future<CoinHistory?> loadCoinHistory(String coinSymbol) async {
    return _coinHistoryBox.values.firstWhereOrNull((coinHistory) => coinHistory.name == coinSymbol);
  }

  Future<void> storeCoins(List<Coin> latestCoins) async {
    await _coinsBox.clear();
    await _coinsBox.addAll(latestCoins);
  }

  Future<void> storeCoinHistory(CoinHistory apiCoinHistory) async {
    final int dbCoinHistoryIndex = _coinHistoryBox.values.toList().indexWhere((_dbCoinHistory) => _dbCoinHistory.name == apiCoinHistory.name);
    if (dbCoinHistoryIndex != -1) _coinHistoryBox.deleteAt(dbCoinHistoryIndex);
    await _coinHistoryBox.add(apiCoinHistory);
  }
}
