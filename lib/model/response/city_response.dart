import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/city_model.dart';

part 'city_response.g.dart';

@JsonSerializable()
class CityResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "cities")
  List<CityModel>? cities;

  CityResponse({this.code, this.success, this.message, this.cities});

  factory CityResponse.fromJson(Map<String, dynamic> json) =>
      _$CityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}
