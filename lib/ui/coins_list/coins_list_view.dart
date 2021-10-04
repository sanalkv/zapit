import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/core/constants/constants.dart';
import 'package:zapit/ui/coins_list/widget/coin_widget.dart';
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
          centerTitle: true,
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
              final imageUrl = model.coinsListResponse?.data?[index].coinInfo?.imageUrl;
              return CoinWidget(
                imageUrl: imageUrl != null ? '$imageBaseUrl$imageUrl' : 'https://www.helptechco.com/files/1215BP6.png',
              coinSymbol: model.coinsListResponse?.data?[index].coinInfo?.name ?? 'N/A',
              );
            },
            itemCount: model.coinsListResponse?.data?.length ?? 0,
          ),
        ),
      ),
      viewModelBuilder: () => CoinsListViewModel(),
    );
  }
}
