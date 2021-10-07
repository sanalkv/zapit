import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/core/model/coin_model.dart';
import 'package:zapit/core/services/coin_service.dart';
import 'package:zapit/core/services/connectivity_service.dart';
import 'package:zapit/core/services/locator.dart';

class CoinDetailsViewModel extends ReactiveViewModel {
  final _coinService = locator<CoinService>();
  final _connectivityService = locator<ConnectivityService>();

  CoinHistory? _coinHistory;

  CoinHistory? get coinHistory => _coinHistory;

  String get timeFrom => getDateFromEpoch(_coinHistory?.timeFrom?.toDouble() ?? 0);
  String get timeTo => getDateFromEpoch(_coinHistory?.timeTo?.toDouble() ?? 0);
  bool get isOnline => _connectivityService.isOnline;

  Future<void> fetchCoinDetails(String coinSymbol) async => _coinHistory = await runBusyFuture<CoinHistory?>(_coinService.fetchCoinHistory(coinSymbol));

  String getDateFromEpoch(double value) => DateFormat.MMMd().format(DateTime.fromMillisecondsSinceEpoch(value.toInt() * 1000));
  
  @override
  List<ReactiveServiceMixin> get reactiveServices => [_connectivityService];
}
