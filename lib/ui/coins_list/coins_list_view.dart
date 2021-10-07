import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/ui/coins_list/widget/coin_widget.dart';
import 'package:zapit/ui/widget/offline_widget.dart';
import 'package:zapit/ui/widget/response_handler.dart';

import 'coins_list_viewmodel.dart';

class CoinsListView extends StatelessWidget {
  const CoinsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CoinsListViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Zapit'),
          actions: [if (!model.isOnline) OfflineWidget()],
        ),
        body: ResponseHandler(
          error: model.modelError,
          hasError: model.hasError,
          isBusy: model.isBusy,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (_, index) {
              return CoinWidget(
                coin: model.coinsList![index]!,
              );
            },
            itemCount: model.coinsList?.length ?? 0,
          ),
        ),
      ),
      viewModelBuilder: () => CoinsListViewModel(),
    );
  }
}
