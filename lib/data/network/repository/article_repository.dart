import 'package:getx_clean/data/mapper/mapper.dart';
import 'package:getx_clean/data/network/error_handler.dart';
import 'package:getx_clean/data/network/failure.dart';
import 'package:getx_clean/data/network/services/rest_service.dart';
import 'package:dartz/dartz.dart';
import 'package:getx_clean/domain/model/article.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getListArticles();
}

class ArticleRepositoryImpl extends ArticleRepository {
  final AppServiceClient _appServiceClient;
  ArticleRepositoryImpl(this._appServiceClient);

  @override
  Future<Either<Failure, List<Article>>> getListArticles() async {
    try {
      final response = await _appServiceClient.getListArticles();
      return Right(response.toDomain());
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
