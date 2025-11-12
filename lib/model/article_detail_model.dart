import 'package:json_annotation/json_annotation.dart';

part 'article_detail_model.g.dart';


@JsonSerializable()
class ArticleDetailModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  ArticleDetailModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory ArticleDetailModel.fromJson(Map<String, dynamic> json) => _$ArticleDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDetailModelToJson(this);
}
