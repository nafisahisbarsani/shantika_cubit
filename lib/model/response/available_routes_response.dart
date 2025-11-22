import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/available_routes_model.dart';

part 'available_routes_response.g.dart';

@JsonSerializable()
class AvailableRoutesResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "routes")
  List<AvailableRoutesModel>? routes;

  AvailableRoutesResponse({this.code, this.success, this.message, this.routes});

  factory AvailableRoutesResponse.fromJson(Map<String, dynamic> json) =>
      _$AvailableRoutesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableRoutesResponseToJson(this);
}
