import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl extends GetxService implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;
  NetworkInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;
}
