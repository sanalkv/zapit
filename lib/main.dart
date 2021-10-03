import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
     MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zapit',
      theme: ThemeData(
        primaryColor: Colors.amber
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
