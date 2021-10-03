import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/ui/coins_list/widget/coin_widget.dart';

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
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (_, index) {
            return CoinWidget();
          },
        ),
      ),
      viewModelBuilder: () => CoinsListViewModel(),
    );
  }
}
