import 'package:get/get.dart';
import 'package:getx_clean/data/network/dio_factory.dart';
import 'package:getx_clean/data/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initDependencyInjection() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  final internetConnectionChecker = InternetConnectionChecker();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut<DioFactory>(() => DioFactory());
  Get.lazyPut<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker));
}
