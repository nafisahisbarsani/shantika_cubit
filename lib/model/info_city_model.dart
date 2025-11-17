import 'package:json_annotation/json_annotation.dart';

part 'info_city_model.g.dart';

@JsonSerializable()
class InfoCityModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "area_id")
  int? areaId;

  InfoCityModel({this.id, this.name, this.areaId});

  factory InfoCityModel.fromJson(Map<String, dynamic> json) =>
      _$InfoCityModelFromJson(json);

  Map<String, dynamic> toJson() => _$InfoCityModelToJson(this);
}
