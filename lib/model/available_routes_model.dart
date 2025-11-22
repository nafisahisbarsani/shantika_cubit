import 'package:json_annotation/json_annotation.dart';

part 'available_routes_model.g.dart';

@JsonSerializable()
class AvailableRoutesModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "layout_id")
  int? layoutId;
  @JsonKey(name: "route_name")
  String? routeName;
  @JsonKey(name: "fleet_name")
  String? fleetName;
  @JsonKey(name: "fleet_detail_time")
  String? fleetDetailTime;
  @JsonKey(name: "fleet_class")
  String? fleetClass;
  @JsonKey(name: "departure_at")
  String? departureAt;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "agency_id")
  int? agencyId;
  @JsonKey(name: "chairs_available")
  int? chairsAvailable;
  @JsonKey(name: "checkpoints")
  Checkpoints? checkpoints;

  AvailableRoutesModel({
    this.id,
    this.layoutId,
    this.routeName,
    this.fleetName,
    this.fleetDetailTime,
    this.fleetClass,
    this.departureAt,
    this.price,
    this.agencyId,
    this.chairsAvailable,
    this.checkpoints,
  });

  factory AvailableRoutesModel.fromJson(Map<String, dynamic> json) =>
      _$AvailableRoutesModelFromJson(json);

  Map<String, dynamic> toJson() => _$AvailableRoutesModelToJson(this);
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

extension AvailableRoutesModelHelpers on AvailableRoutesModel {
  String get departureCity => checkpoints?.start?.cityName ?? '';
  String get arrivalCity => checkpoints?.destination?.cityName ?? '';
  String get departure => checkpoints?.start?.agencyName ?? '';
  String get arrival => checkpoints?.destination?.agencyName ?? '';
  String get busName => fleetName ?? '';
  String get fullRoute => routeName ?? '';
  String get shortRoute {
    if (routeName == null || routeName!.isEmpty) return '';

    final cleanRoute = routeName!.trim().replaceAll(RegExp(r'^~+|~+$'), '');
    final routes = cleanRoute.split('~~').where((s) => s.trim().isNotEmpty).toList();

    if (routes.length <= 4) {
      return routes.join('~~');
    }

    final first4 = routes.take(4).toList();
    return '${first4.join('~~')}...';
  }  int get seatsLeft => chairsAvailable ?? 0;
  String get date => departureAt != null ? departureAt!.split('T').first : '';
  String get timeStart {
    if (departureAt == null) return '';
    try {
      final timePart = departureAt!.split('T').last;
      final dt = DateTime.parse("2000-01-01 $timePart");
      final formatted =
          "${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
      return "$formatted WIB";
    } catch (_) {
      return departureAt!;
    }
  }

  String get fleetClassName => fleetClass ?? '';
  String get priceText => price != null ? 'Rp$price' : '-';
}
