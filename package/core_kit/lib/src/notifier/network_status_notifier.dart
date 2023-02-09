import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

enum NetworkStatus {
  connected,
  disConnected,
}

/// 是否有网络连接，true为有，false为无
class NetworkStatusNotifier extends ValueNotifier<bool> {
  NetworkStatusNotifier({required bool isConnected}) : super(isConnected);

  static bool isConnected(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
      case ConnectivityResult.bluetooth:
        return false;
      default:
        return true;
    }
  }
}
