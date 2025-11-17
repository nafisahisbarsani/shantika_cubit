import 'package:json_annotation/json_annotation.dart';
import 'departure_time_model.dart';

part 'info_agen_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoAgenModel {
  final int? id;
  @JsonKey(name: 'agency_name')
  final String? agencyName;
  @JsonKey(name: 'city_name')
  final String? cityName;
  @JsonKey(name: 'agency_address')
  final String? agencyAddress;
  @JsonKey(name: 'agency_phone')
  final String? agencyPhone;
  final List<String>? phone;
  @JsonKey(name: 'agency_avatar')
  final String? agencyAvatar;
  @JsonKey(name: 'agency_lat')
  final String? agencyLat;
  @JsonKey(name: 'agency_lng')
  final String? agencyLng;
  @JsonKey(name: 'morning_time')
  final String? morningTime;
  @JsonKey(name: 'night_time')
  final String? nightTime;
  @JsonKey(name: 'agency_departure_times')
  final List<DepartureTimeModel>? agencyDepartureTimes;

  InfoAgenModel({
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

  factory InfoAgenModel.fromJson(Map<String, dynamic> json) =>
      _$InfoAgenModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoAgenModelToJson(this);
}
