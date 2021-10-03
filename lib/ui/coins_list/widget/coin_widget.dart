import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  final String imageUrl;
  const CoinWidget({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
