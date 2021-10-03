import 'package:stacked/stacked.dart';
import 'package:zapit/core/model/coins_list_model.dart';
import 'package:zapit/core/services/api/api_service.dart';
import 'package:zapit/core/services/locator.dart';

class CoinsListViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();

  CoinsListResponse? _coinsListResponse;

  CoinsListResponse? get coinsListResponse => _coinsListResponse;

  CoinsListViewModel() {
    fetchCoinsList();
  }

  Future<void> fetchCoinsList()async{
   _coinsListResponse = await runBusyFuture<CoinsListResponse?>(_apiService.listCoins('USD'));

  }
}
