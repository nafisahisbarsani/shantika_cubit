import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/fleet_model.dart';

part 'fleet_response.g.dart';

@JsonSerializable()
class FleetResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "fleet_classes")
  List<FleetModel>? fleetClasses;

  FleetResponse({this.code, this.success, this.message, this.fleetClasses});

  factory FleetResponse.fromJson(Map<String, dynamic> json) =>
      _$FleetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FleetResponseToJson(this);
}
