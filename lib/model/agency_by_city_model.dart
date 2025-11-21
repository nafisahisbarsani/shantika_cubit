import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/departure_time_model.dart';

part 'agency_by_city_model.g.dart';

@JsonSerializable()
class AgencyByCityModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "agency_name")
  String? agencyName;
  @JsonKey(name: "city_name")
  String? cityName;
  @JsonKey(name: "agency_address")
  String? agencyAddress;
  @JsonKey(name: "agency_phone")
  String? agencyPhone;
  @JsonKey(name: "phone")
  List<String>? phone;
  @JsonKey(name: "agency_avatar")
  AgencyAvatar? agencyAvatar;
  @JsonKey(name: "agency_lat")
  String? agencyLat;
  @JsonKey(name: "agency_lng")
  String? agencyLng;
  @JsonKey(name: "morning_time")
  String? morningTime;
  @JsonKey(name: "night_time")
  String? nightTime;
  @JsonKey(name: "agency_departure_times")
  List<DepartureTimeModel>? agencyDepartureTimes;

  AgencyByCityModel({
    this.id,
    this.agencyName,
    this.cityName,
    this.agencyAddress,
    this.agencyPhone,
    this.phone,
    this.agencyAvatar,
    this.agencyLat,
    this.agencyLng,
    this.morningTime,
    this.nightTime,
    this.agencyDepartureTimes,
  });

  factory AgencyByCityModel.fromJson(Map<String, dynamic> json) =>
      _$AgencyByCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyByCityModelToJson(this);
}

enum AgencyAvatar {
  @JsonValue("/avatar/KbzwboL5uHghGdeJyTyJrEWdWwWfw1DlkJXDCrwl.jpg")
  AVATAR_KBZWBO_L5_U_HGH_GDE_JY_TY_JR_E_WD_WW_WFW1_DLK_JXD_CRWL_JPG,
  @JsonValue("")
  EMPTY,
}
