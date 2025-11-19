import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/social_media_model.dart';

part 'social_media_response.g.dart';

@JsonSerializable()
class SocialMediaResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "social_medias")
  List<SocialMediaModel>? socialMedias;

  SocialMediaResponse({
    this.code,
    this.success,
    this.message,
    this.socialMedias,
  });

  factory SocialMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaResponseToJson(this);
}
