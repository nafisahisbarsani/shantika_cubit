import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/info_city_model.dart';

part 'info_city_response.g.dart';

@JsonSerializable()
class InfoCityResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "cities")
  List<InfoCityModel>? cities;

  InfoCityResponse({this.code, this.success, this.message, this.cities});

  factory InfoCityResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoCityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoCityResponseToJson(this);
}
