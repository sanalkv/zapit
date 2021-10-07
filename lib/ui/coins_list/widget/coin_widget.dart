import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/core/model/coin_model.dart';
import 'package:zapit/ui/coins_list/coins_list_viewmodel.dart';
import 'package:zapit/ui/widget/image_widget.dart';

class CoinWidget extends ViewModelWidget<CoinsListViewModel> {
  final Coin coin;
  const CoinWidget({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return GestureDetector(
      onTap: () => viewModel.goToCoinDetailsView(coin),
      child: Container(
        padding: const EdgeInsets.all(16),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(blurRadius: 6, color: Colors.grey[300]!),
          ],
        ),
        child: ImageWidget(coin: coin,),
      ),
    );
  }
}
