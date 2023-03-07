import 'package:get/get.dart';
import 'package:getx_clean/data/network/repository/article_repository.dart';
import 'package:getx_clean/domain/model/article.dart';

class HomeController extends GetxController with StateMixin<List<Article>> {
  final ArticleRepository articleRepository;
  HomeController(this.articleRepository);
  final count = 0.obs;
  List<Article> listArticle = [];

  @override
  void onReady() {
    getListArticles();
    super.onReady();
  }

  Future getListArticles() async {
    change(listArticle, status: RxStatus.loading());
    (await articleRepository.getListArticles()).fold((failure) {
      change([], status: RxStatus.error(failure.message));
    }, (data) async {
      change(data,
          status: data.isEmpty ? RxStatus.empty() : RxStatus.success());
    });
  }

  void increment() => count.value++;
}
