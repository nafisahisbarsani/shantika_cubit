import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HomeModel {
  final int? code;
  final bool? success;
  final String? message;
  final List<SliderModel>? slider;
  final List<ArtikelModel>? artikel;

  @JsonKey(name: 'customer_menu')  // ← THIS IS CRITICAL!
  final List<CustomerMenuModel>? customerMenu;

  final List<dynamic>? testimonial;
  final List<dynamic>? promo;

  @JsonKey(name: 'pending_reviews')
  final List<PendingReviewModel>? pendingReviews;

  @JsonKey(name: 'is_active_customer_order')
  final bool? isActiveCustomerOrder;

  @JsonKey(name: 'time_limit_before_order')
  final String? timeLimitBeforeOrder;

  HomeModel({
    this.code,
    this.success,
    this.message,
    this.slider,
    this.artikel,
    this.customerMenu,
    this.testimonial,
    this.promo,
    this.pendingReviews,
    this.isActiveCustomerOrder,
    this.timeLimitBeforeOrder,
  });

  factory HomeModel.empty() => HomeModel(
    code: 0,
    success: false,
    message: '',
    slider: const [],
    artikel: const [],
    customerMenu: const [],
    testimonial: const [],
    promo: const [],
    pendingReviews: const [],
    isActiveCustomerOrder: false,
    timeLimitBeforeOrder: '',
  );

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class SliderModel {
  final int? id;

  // API returns "name", not "title"
  final String? name;

  final String? image;
  final String? description;
  final String? type;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  SliderModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
  Map<String, dynamic> toJson() => _$SliderModelToJson(this);
}

@JsonSerializable()
class ArtikelModel {
  final int? id;

  // API returns "name", not "title"
  final String? name;

  final String? image;

  // API returns "description", not "content"
  final String? description;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  ArtikelModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory ArtikelModel.fromJson(Map<String, dynamic> json) =>
      _$ArtikelModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArtikelModelToJson(this);
}

@JsonSerializable()
class CustomerMenuModel {
  final int? id;

  // API returns "name", not "title"
  final String? name;

  final String? icon;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  final int? order;

  // API returns "value", not "link"
  final String? value;

  final String? type;

  CustomerMenuModel({
    this.id,
    this.name,
    this.icon,
    this.createdAt,
    this.updatedAt,
    this.order,
    this.value,
    this.type,
  });

  factory CustomerMenuModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerMenuModelFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerMenuModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PendingReviewModel {
  final int? id;

  @JsonKey(name: 'code_order')
  final String? codeOrder;

  @JsonKey(name: 'name_fleet')
  final String? nameFleet;

  @JsonKey(name: 'fleet_class')
  final String? fleetClass;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'departure_at')
  final String? departureAt;

  final int? price;
  final String? status;
  final CheckpointsModel? checkpoints;

  PendingReviewModel({
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

  factory PendingReviewModel.fromJson(Map<String, dynamic> json) =>
      _$PendingReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$PendingReviewModelToJson(this);
}

@JsonSerializable()
class CheckpointsModel {
  final AgencyModel? start;
  final AgencyModel? destination;
  final AgencyModel? end;

  CheckpointsModel({
    this.start,
    this.destination,
    this.end,
  });

  factory CheckpointsModel.fromJson(Map<String, dynamic> json) =>
      _$CheckpointsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CheckpointsModelToJson(this);
}

@JsonSerializable()
class AgencyModel {
  @JsonKey(name: 'agency_id')
  final int? agencyId;

  @JsonKey(name: 'agency_name')
  final String? agencyName;

  @JsonKey(name: 'agency_address')
  final String? agencyAddress;

  @JsonKey(name: 'agency_phone')
  final String? agencyPhone;

  @JsonKey(name: 'agency_lat')
  final String? agencyLat;

  @JsonKey(name: 'agency_lng')
  final String? agencyLng;

  @JsonKey(name: 'city_name')
  final String? cityName;

  AgencyModel({
    this.agencyId,
    this.agencyName,
    this.agencyAddress,
    this.agencyPhone,
    this.agencyLat,
    this.agencyLng,
    this.cityName,
  });

  factory AgencyModel.fromJson(Map<String, dynamic> json) =>
      _$AgencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$AgencyModelToJson(this);
}