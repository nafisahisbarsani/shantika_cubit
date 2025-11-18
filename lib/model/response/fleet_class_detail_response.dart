import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/fleet_class_detail_model.dart';

part 'fleet_class_detail_response.g.dart';

@JsonSerializable()
class FleetClassDetailResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "fleet_detail")
  FleetClassDetailModel? fleetDetail;

  FleetClassDetailResponse({
    this.code,
    this.success,
    this.message,
    this.fleetDetail,
  });

  factory FleetClassDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$FleetClassDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FleetClassDetailResponseToJson(this);
}
