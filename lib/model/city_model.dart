import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "province_id")
  int? provinceId;
  @JsonKey(name: "area_id")
  int? areaId;
  @JsonKey(name: "pg_id")
  String? pgId;
  @JsonKey(name: "duration")
  int? duration;
  @JsonKey(name: "agent_count")
  int? agentCount;

  CityModel({
    this.id,
    this.name,
    this.provinceId,
    this.areaId,
    this.pgId,
    this.duration,
    this.agentCount,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
