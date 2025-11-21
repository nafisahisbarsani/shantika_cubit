import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/agency_by_city_model.dart';

part 'agency_by_city_response.g.dart';

@JsonSerializable()
class AgencyByCityResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "agencies")
  List<AgencyByCityModel>? agencies;

  AgencyByCityResponse({
    this.code,
    this.success,
    this.message,
    this.agencies,
  });

  factory AgencyByCityResponse.fromJson(Map<String, dynamic> json) => _$AgencyByCityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyByCityResponseToJson(this);
}