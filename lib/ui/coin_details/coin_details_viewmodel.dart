import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/core/model/coin_details_model.dart';
import 'package:zapit/core/services/api/api_service.dart';
import 'package:zapit/core/services/locator.dart';

class CoinDetailsViewModel extends BaseViewModel {
    final _apiService = locator<ApiService>();

  CoinDetailsResponse? _coinDetailsResponse;

  CoinDetailsResponse? get coinDetailsResponse => _coinDetailsResponse;

  String get timeFrom =>getDateFromEpoch(_coinDetailsResponse?.data?.timeFrom?.toDouble()??0);
  String get timeTo =>getDateFromEpoch(_coinDetailsResponse?.data?.timeTo?.toDouble()??0);


  Future<void> fetchCoinDetails(String coinSymbol) async {
    _coinDetailsResponse = await runBusyFuture<CoinDetailsResponse?>(_apiService.getCoinDetails('USD', coinSymbol,6));
  }

  String getDateFromEpoch(double value){
   return  DateFormat.MMMd().format(DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000));
  }

}