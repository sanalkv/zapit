import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  const CoinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(blurRadius: 6, color: Colors.grey[300]!),
        ],
      ),
      child: CachedNetworkImage(
        imageUrl: 'https://images.unsplash.com/photo-1543699539-33a389c5dcfe?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80',
        fit: BoxFit.cover,
      ),
    );
  }
}
