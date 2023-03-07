import 'package:getx_clean/data/responses/article_response.dart';
import 'package:getx_clean/domain/model/article.dart';

extension ArticleResponseMapper on ArticleResponse {
  List<Article> toDomain() {
    return items?.map((item) {
          return Article(
            author: item.author ?? '',
            title: item.title ?? '',
            description: item.description ?? '',
            url: item.url ?? '',
            urlToImage: item.urlToImage ?? '',
            publishedAt: item.publishedAt ?? '',
            content: item.content ?? '',
          );
        }).toList() ??
        [];
  }
}
