import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/agency_model.dart';

part 'agency_response.g.dart';

@JsonSerializable()
class AgencyResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "agencies_city")
  List<AgencyModel>? agenciesCity;
  AgencyResponse({this.code, this.success, this.message, this.agenciesCity});

  factory AgencyResponse.fromJson(Map<String, dynamic> json) =>
      _$AgencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyResponseToJson(this);
}
