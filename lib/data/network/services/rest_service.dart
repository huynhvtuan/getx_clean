import 'package:dio/dio.dart';
import 'package:getx_clean/data/responses/article_response.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@RestApi()
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio) => _AppServiceClient(dio);

  @GET("/v2/top-headlines")
  Future<ArticleResponse> getListArticles();
}
