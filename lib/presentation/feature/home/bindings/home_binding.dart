import 'package:get/get.dart';
import 'package:getx_clean/data/network/dio_factory.dart';
import 'package:getx_clean/data/network/repository/article_repository.dart';
import 'package:getx_clean/data/network/services/rest_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  final DioFactory dioFactory = Get.find();
  @override
  void dependencies() {
    Get.lazyPut<ArticleRepository>(
        () => ArticleRepositoryImpl(AppServiceClient(dioFactory.dio)));
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find()),
    );
  }
}
