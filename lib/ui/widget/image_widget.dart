import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zapit/core/constants/constants.dart';
import 'package:zapit/core/model/coin_model.dart';

import 'loader.dart';

class ImageWidget extends StatelessWidget {
  final Coin coin;
  final double? height;
  final double? width;

  const ImageWidget({
    Key? key,
    required this.coin,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      placeholder: (_, __) => Center(child: const Loader()),
      errorWidget: (_, __, ___) => Text(coin.fullName ?? coin.name ?? 'Image not available'),
      imageUrl: coin.imagePath != null ? '$imageBaseUrl${coin.imagePath}' : 'https://www.helptechco.com/files/1215BP6.png',
    );
  }
}
