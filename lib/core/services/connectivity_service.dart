import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';

class ConnectivityService with ReactiveServiceMixin {
  late ReactiveValue<bool> _isOnline = ReactiveValue(false);

  bool get isOnline => _isOnline.value;

  ConnectivityService() {
    listenToReactiveValues([_isOnline]);
    Connectivity().onConnectivityChanged.listen((event) {
      checkConnectivity();
      // Fetch coin history api if required.
    });
  }

  /// Check if internet is available
  Future<bool> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile && await _addressLookUp()) {
      _isOnline.value = true;
    } else if (connectivityResult == ConnectivityResult.wifi && await _addressLookUp()) {
      _isOnline.value = true;
    } else {
      _isOnline.value = false;
    }
    return _isOnline.value;
  }

  // loads a domain to confirm internet connectivity
  Future<bool> _addressLookUp() async {
    try {
      final result = await InternetAddress.lookup("www.google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
