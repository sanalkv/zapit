import 'package:stacked/stacked.dart';
import 'package:zapit/core/model/coin_details_model.dart';
import 'package:zapit/core/services/api/api_service.dart';
import 'package:zapit/core/services/locator.dart';

class CoinDetailsViewModel extends BaseViewModel {
    final _apiService = locator<ApiService>();

  CoinDetailsResponse? _coinDetailsResponse;

  CoinDetailsResponse? get coinDetailsResponse => _coinDetailsResponse;

  Future<void> fetchCoinDetails(String coinSymbol) async {
    _coinDetailsResponse = await runBusyFuture<CoinDetailsResponse?>(_apiService.getCoinDetails('USD', coinSymbol,20));
  }

}