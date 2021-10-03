import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coin_details_viewmodel.dart';


class CoinDetailsView extends StatelessWidget {
 const CoinDetailsView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<CoinDetailsViewModel>.reactive(
     builder: (context, model, child) => Scaffold(),
     viewModelBuilder: () => CoinDetailsViewModel(),
   );
 }
}