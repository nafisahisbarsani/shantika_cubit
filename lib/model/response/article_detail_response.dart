import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/article_model.dart';

part 'article_detail_response.g.dart';

@JsonSerializable()
class ArticleDetailResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "article")
  ArticleModel? article;

  ArticleDetailResponse({this.code, this.success, this.message, this.article});

  factory ArticleDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDetailResponseToJson(this);
}
