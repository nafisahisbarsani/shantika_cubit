import 'package:json_annotation/json_annotation.dart';

part 'fleet_model.g.dart';

@JsonSerializable()
class FleetModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "price_food")
  String? priceFood;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "fleets_count")
  int? fleetsCount;
  @JsonKey(name: "price_fleet_class1")
  int? priceFleetClass1;
  @JsonKey(name: "price_fleet_class2")
  int? priceFleetClass2;
  @JsonKey(name: "seat_capacity")
  int? seatCapacity;

  FleetModel({
    this.id,
    this.name,
    this.priceFood,
    this.code,
    this.fleetsCount,
    this.priceFleetClass1,
    this.priceFleetClass2,
    this.seatCapacity,
  });

  factory FleetModel.fromJson(Map<String, dynamic> json) =>
      _$FleetModelFromJson(json);

  Map<String, dynamic> toJson() => _$FleetModelToJson(this);
}
