import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

class ConnectivityController extends GetxController {
  // Observable for connection type
  final _connectionType = MyConnectivityResult.none.obs;

  // Observable for internet connectivity status
  final isInternetConnected = false.obs;

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;

  // Getter for connection type
  MyConnectivityResult get connectionType => _connectionType.value;

  // Setter for connection type
  set connectionType(MyConnectivityResult value) {
    _connectionType.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getConnectivityType();
    _streamSubscription = _connectivity.onConnectivityChanged
        .debounceTime(const Duration(seconds: 2))
        .listen(_updateState);
  }

  /// Fetches the current connectivity status and updates the state
  Future<void> getConnectivityType() async {
    List<ConnectivityResult> connectivityResults = [];
    try {
      connectivityResults = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to get connectivity: $e');
      }
    }
    _updateState(connectivityResults);
  }

  /// Updates the connection type and internet connectivity status
  void _updateState(List<ConnectivityResult> results) async {
    if (results.isNotEmpty) {
      ConnectivityResult result = results.first;
      bool hasInternet = false;

      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
        case ConnectivityResult.ethernet:
        case ConnectivityResult.vpn:
          connectionType = _getConnectivityResult(result);
          hasInternet = await checkInternetAccess();
          isInternetConnected.value = hasInternet;
          break;
        case ConnectivityResult.none:
          connectionType = MyConnectivityResult.none;
          isInternetConnected.value = false;
          break;
        default:
          if (kDebugMode) {
            print('Unknown connectivity result: $result');
          }
          isInternetConnected.value = false;
          break;
      }
    } else {
      connectionType = MyConnectivityResult.none;
      isInternetConnected.value = false;
    }
  }

  /// Maps ConnectivityResult to MConnectivityResult enum
  MyConnectivityResult _getConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return MyConnectivityResult.wifi;
      case ConnectivityResult.mobile:
        return MyConnectivityResult.mobile;
      case ConnectivityResult.ethernet:
        return MyConnectivityResult.ethernet;
      case ConnectivityResult.vpn:
        return MyConnectivityResult.vpn;
      default:
        return MyConnectivityResult.none;
    }
  }

  /// Checks actual internet access by pinging a reliable server
  Future<bool> checkInternetAccess() async {
    try {
      final result = await InternetAddress.lookup('example.com')
          .timeout(const Duration(seconds: 5));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Internet Access Check Failed: $e');
      }
    }
    return false;
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
    super.onClose();
  }
}

/// Custom enum to represent simplified connectivity statuses
enum MyConnectivityResult { none, wifi, mobile, ethernet, vpn }
