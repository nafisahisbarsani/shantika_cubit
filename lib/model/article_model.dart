import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';


@JsonSerializable()
class ArticleModel {
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

  ArticleModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
