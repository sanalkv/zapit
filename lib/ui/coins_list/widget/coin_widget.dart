import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zapit/ui/coins_list/coins_list_viewmodel.dart';

class CoinWidget extends ViewModelWidget<CoinsListViewModel> {
  final String imageUrl;
  final String coinSymbol;
  const CoinWidget({
    Key? key,
    required this.imageUrl,
    required this.coinSymbol,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return GestureDetector(
      onTap: () => viewModel.goToCoinDetailsView(coinSymbol),
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
        child: CachedNetworkImage(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
