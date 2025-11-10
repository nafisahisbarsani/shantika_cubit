import 'package:json_annotation/json_annotation.dart';
import '../about_us_model.dart';

part 'about_us_response.g.dart';

@JsonSerializable()
class AboutUsResponse {
  @JsonKey(name: "code")
  final int? code;

  @JsonKey(name: "success")
  final bool? success;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "about")
  final AboutUsModel? about;

  AboutUsResponse({
    this.code,
    this.success,
    this.message,
    this.about,
  });

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) =>
      _$AboutUsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AboutUsResponseToJson(this);
}
