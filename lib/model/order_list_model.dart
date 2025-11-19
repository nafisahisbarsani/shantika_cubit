import 'package:json_annotation/json_annotation.dart';

part 'order_list_model.g.dart';

@JsonSerializable()
class OrderListModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "code_order")
  String? codeOrder;
  @JsonKey(name: "name_fleet")
  String? nameFleet;
  @JsonKey(name: "fleet_class")
  String? fleetClass;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "departure_at")
  String? departureAt;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "checkpoints")
  Checkpoints? checkpoints;

  OrderListModel({
    this.id,
    this.codeOrder,
    this.nameFleet,
    this.fleetClass,
    this.createdAt,
    this.departureAt,
    this.price,
    this.status,
    this.checkpoints,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) =>
      _$OrderListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListModelToJson(this);
}

@JsonSerializable()
class Checkpoints {
  @JsonKey(name: "start")
  Destination? start;
  @JsonKey(name: "destination")
  Destination? destination;
  @JsonKey(name: "end")
  Destination? end;

  Checkpoints({this.start, this.destination, this.end});

  factory Checkpoints.fromJson(Map<String, dynamic> json) =>
      _$CheckpointsFromJson(json);

  Map<String, dynamic> toJson() => _$CheckpointsToJson(this);
}

@JsonSerializable()
class Destination {
  @JsonKey(name: "agency_id")
  int? agencyId;
  @JsonKey(name: "agency_name")
  String? agencyName;
  @JsonKey(name: "agency_address")
  String? agencyAddress;
  @JsonKey(name: "agency_phone")
  String? agencyPhone;
  @JsonKey(name: "agency_lat")
  String? agencyLat;
  @JsonKey(name: "agency_lng")
  String? agencyLng;
  @JsonKey(name: "city_name")
  String? cityName;

  Destination({
    this.agencyId,
    this.agencyName,
    this.agencyAddress,
    this.agencyPhone,
    this.agencyLat,
    this.agencyLng,
    this.cityName,
  });

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}
