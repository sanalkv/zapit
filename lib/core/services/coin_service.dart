import 'package:zapit/core/model/coin_model.dart';
import 'package:zapit/core/model/coins_list_model.dart';
import 'package:zapit/core/services/api/api_service.dart';
import 'package:zapit/core/services/coin_db_service.dart';
import 'package:zapit/core/services/locator.dart';

class CoinService {
  final _apiService = locator<ApiService>();
  final _coinDBService = locator<CoinDBService>();

  /// Returns Coins
  Future<List<Coin>> fetchCoinsList() async {
    try {
      CoinsListResponse _coinsListResponse = await _apiService.listCoins('USD');
      return await _storeCoinsInDB(_coinsListResponse);
    } catch (e) {
      List<Coin> coinsList = await _fetchCoinsFromDB();
      if (coinsList != null && coinsList.isNotEmpty)
        return coinsList;
      else
        rethrow;
    }
  }

  /// Saves and returns the stored coins.
  Future<List<Coin>> _storeCoinsInDB(CoinsListResponse _coinsListResponse) async {
    List<Coin> coins = [];
    _coinsListResponse.data?.forEach((coinApiData) {
      final coin = Coin(
        name: coinApiData.coinInfo?.name ?? 'N/A',
        fullName: coinApiData.coinInfo?.fullName ?? 'N/A',
        imagePath: coinApiData.coinInfo?.imageUrl ?? 'N/A',
      );
      coins.add(coin);
    });
    await _coinDBService.storeCoins(coins);
    return coins;
  }

  /// Returns the saved coins
  Future<List<Coin>> _fetchCoinsFromDB() async {
    return await _coinDBService.loadCoins();
  }
}
