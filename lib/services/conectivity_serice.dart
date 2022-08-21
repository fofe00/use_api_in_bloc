import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConectityServce {
  final _connectivity = Connectivity();
  final connnectivityStream = StreamController<ConnectivityResult>();
  ConectityServce() {
    _connectivity.onConnectivityChanged.listen((event) {
      connnectivityStream.add(event);
    });
  }

  Future<bool> getStateConnection() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
