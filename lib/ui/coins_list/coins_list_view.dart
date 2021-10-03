import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'coins_list_viewmodel.dart';

class CoinsListView extends StatelessWidget {
 const CoinsListView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<CoinsListViewModel>.reactive(
     builder: (context, model, child) => Scaffold(
       
     ),
     viewModelBuilder: () => CoinsListViewModel(),
   );
 }
}