import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zapit/core/services/connectivity_service.dart';
import 'package:zapit/core/services/locator.dart';

Future<void> initApp()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter('hive_db');
  await setUpLocator();
  await locator<ConnectivityService>().checkConnectivity();
}