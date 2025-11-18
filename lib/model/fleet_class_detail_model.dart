import 'package:json_annotation/json_annotation.dart';

part 'fleet_class_detail_model.g.dart';

@JsonSerializable()
class FleetClassDetailModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "images")
  List<String>? images;
  @JsonKey(name: "fleet_class")
  String? fleetClass;
  @JsonKey(name: "total_chair")
  int? totalChair;
  @JsonKey(name: "estimate_time")
  String? estimateTime;
  @JsonKey(name: "facilities")
  List<Facility>? facilities;
  @JsonKey(name: "route")
  List<dynamic>? route;

  FleetClassDetailModel({
    this.id,
    this.name,
    this.description,
    this.image,
    this.images,
    this.fleetClass,
    this.totalChair,
    this.estimateTime,
    this.facilities,
    this.route,
  });

  factory FleetClassDetailModel.fromJson(Map<String, dynamic> json) =>
      _$FleetClassDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$FleetClassDetailModelToJson(this);
}

@JsonSerializable()
class Facility {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  Facility({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  factory Facility.fromJson(Map<String, dynamic> json) =>
      _$FacilityFromJson(json);

  Map<String, dynamic> toJson() => _$FacilityToJson(this);
}
