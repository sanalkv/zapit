import 'package:zapit/core/model/coin_details_model.dart';
import 'package:zapit/core/model/coin_model.dart';
import 'package:zapit/core/model/coins_list_model.dart';
import 'package:zapit/core/services/api/api_service.dart';
import 'package:zapit/core/services/coin_db_service.dart';
import 'package:zapit/core/services/locator.dart';

class CoinService {
  final _apiService = locator<ApiService>();
  final _coinDBService = locator<CoinDBService>();

  /// Returns coins list
  Future<List<Coin?>> fetchCoinsList() async {
    try {
      CoinsListResponse _coinsListResponse = await _apiService.listCoins('USD');
      return await _storeCoinsInDB(_coinsListResponse);
    } catch (e) {
      List<Coin?>? coinsList = await _fetchCoinsFromDB();
      if (coinsList != null && coinsList.isNotEmpty)
        return coinsList;
      else
        rethrow;
    }
  }

  /// Returns coin history
  Future<CoinHistory> fetchCoinHistory(String coinSymbol) async {
    try {
      CoinDetailsResponse _coinDetailsResponse = await _apiService.getCoinDetails('USD', coinSymbol, 6);
      return await _storeCoinHistoryInDB(_coinDetailsResponse, coinSymbol);
    } catch (e) {
      CoinHistory? coinHistory = await _fetchCoinHistoryFromDB(coinSymbol);
      if (coinHistory != null)
        return coinHistory;
      else
        rethrow;
    }
  }

  /// Saves and returns the stored coins list.
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

  /// Saves and returns the stored coin history.
  Future<CoinHistory> _storeCoinHistoryInDB(CoinDetailsResponse coinDetailsResponse, String coinSymbol) async {
    CoinHistory coinHistory = CoinHistory(
      name: coinSymbol,
      timeFrom: coinDetailsResponse.data?.timeFrom ?? 0,
      timeTo: coinDetailsResponse.data?.timeTo ?? 0,
      priceData: [],
    );
    coinDetailsResponse.data?.data?.forEach((coinHisotryApiData) {
      final priceData = PriceData(
        time: coinHisotryApiData.time,
        price: coinHisotryApiData.close,
      );
      coinHistory.priceData?.add(priceData);
    });
    await _coinDBService.storeCoinHistory(coinHistory);
    return coinHistory;
  }

  /// Returns the saved coins list
  Future<List<Coin?>?> _fetchCoinsFromDB() async {
    return await _coinDBService.loadCoins();
  }

    /// Returns the saved coin history
  Future<CoinHistory?> _fetchCoinHistoryFromDB(String coinSymbol) async {
    return await _coinDBService.loadCoinHistory(coinSymbol);
  }

}
