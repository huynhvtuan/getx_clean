import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_clean/app/routes/app_pages.dart';
import 'package:getx_clean/domain/model/article.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
          child: controller.obx(
        (state) => ListView.builder(
          itemCount: state!.length,
          itemBuilder: (context, index) {
            final article = state[index];
            return NewCard(article: article);
          },
        ),
        onEmpty: const Center(child: Text('No news today')),
        onError: (err) => Center(child: Text(err ?? '')),
        onLoading: const Center(child: CircularProgressIndicator()),
      )),
    );
  }
}

class NewCard extends StatelessWidget {
  const NewCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.HOME_DETAIL),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            article.urlToImage.isNotEmpty
                ? Container(
                    height: Get.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(article.urlToImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  article.description.isNotEmpty
                      ? const Divider(color: Colors.black)
                      : const SizedBox.shrink(),
                  Text(
                    article.description,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
