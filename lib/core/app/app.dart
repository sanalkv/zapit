import 'package:stacked/stacked_annotations.dart';
import 'package:zapit/ui/coin_details/coin_details_view.dart';
import 'package:zapit/ui/coins_list/coins_list_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page:CoinsListView,initial: true),
    MaterialRoute(page:CoinDetailsView),
  ],
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
