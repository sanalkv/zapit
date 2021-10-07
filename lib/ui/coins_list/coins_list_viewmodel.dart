import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zapit/core/app/app.router.dart';
import 'package:zapit/core/model/coin_model.dart';
import 'package:zapit/core/services/coin_service.dart';
import 'package:zapit/core/services/connectivity_service.dart';
import 'package:zapit/core/services/locator.dart';

class CoinsListViewModel extends ReactiveViewModel {
  final _navigationService = locator<NavigationService>();
  final _connectivityService = locator<ConnectivityService>();
  final _coinService = locator<CoinService>();

  List<Coin?>? _coinsList;

  List<Coin?>? get coinsList => _coinsList;
  bool get isOnline => _connectivityService.isOnline;

  CoinsListViewModel() {
    fetchCoinsList();
  }

  Future<void> fetchCoinsList() async => _coinsList = await runBusyFuture<List<Coin?>?>(_coinService.fetchCoinsList());

  void goToCoinDetailsView(Coin coin) => _navigationService.navigateTo(Routes.coinDetailsView, arguments: CoinDetailsViewArguments(coin: coin));

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_connectivityService];
}
