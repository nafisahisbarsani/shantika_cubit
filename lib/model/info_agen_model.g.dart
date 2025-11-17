// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_agen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoAgenModel _$InfoAgenModelFromJson(Map<String, dynamic> json) =>
    InfoAgenModel(
      id: (json['id'] as num?)?.toInt(),
      agencyName: json['agency_name'] as String?,
      cityName: json['city_name'] as String?,
      agencyAddress: json['agency_address'] as String?,
      agencyPhone: json['agency_phone'] as String?,
      phone: (json['phone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      agencyAvatar: json['agency_avatar'] as String?,
      agencyLat: json['agency_lat'] as String?,
      agencyLng: json['agency_lng'] as String?,
      morningTime: json['morning_time'] as String?,
      nightTime: json['night_time'] as String?,
      agencyDepartureTimes: (json['agency_departure_times'] as List<dynamic>?)
          ?.map((e) => DepartureTimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InfoAgenModelToJson(InfoAgenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agency_name': instance.agencyName,
      'city_name': instance.cityName,
      'agency_address': instance.agencyAddress,
      'agency_phone': instance.agencyPhone,
      'phone': instance.phone,
      'agency_avatar': instance.agencyAvatar,
      'agency_lat': instance.agencyLat,
      'agency_lng': instance.agencyLng,
      'morning_time': instance.morningTime,
      'night_time': instance.nightTime,
      'agency_departure_times': instance.agencyDepartureTimes
          ?.map((e) => e.toJson())
          .toList(),
    };
