// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ui/coin_details/coin_details_view.dart';
import '../../ui/coins_list/coins_list_view.dart';
import '../model/coin_model.dart';

class Routes {
  static const String coinsListView = '/';
  static const String coinDetailsView = '/coin-details-view';
  static const all = <String>{
    coinsListView,
    coinDetailsView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.coinsListView, page: CoinsListView),
    RouteDef(Routes.coinDetailsView, page: CoinDetailsView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    CoinsListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CoinsListView(),
        settings: data,
      );
    },
    CoinDetailsView: (data) {
      var args = data.getArgs<CoinDetailsViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => CoinDetailsView(
          key: args.key,
          coin: args.coin,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CoinDetailsView arguments holder class
class CoinDetailsViewArguments {
  final Key? key;
  final Coin coin;
  CoinDetailsViewArguments({this.key, required this.coin});
}
