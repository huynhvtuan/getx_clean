import 'package:json_annotation/json_annotation.dart';
part 'article_response.g.dart';

@JsonSerializable()
class ArticleResponse {
  final String? status;
  final int? totalResults;
  @JsonKey(name: 'articles')
  final List<ArticleItem>? items;

  const ArticleResponse({this.items, this.status, this.totalResults});
  factory ArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleResponseToJson(this);
}

@JsonSerializable()
class ArticleItem {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;

  const ArticleItem({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory ArticleItem.fromJson(Map<String, dynamic> json) =>
      _$ArticleItemFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleItemToJson(this);
}
