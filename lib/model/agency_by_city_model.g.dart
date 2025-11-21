// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_by_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyByCityModel _$AgencyByCityModelFromJson(Map<String, dynamic> json) =>
    AgencyByCityModel(
      id: (json['id'] as num?)?.toInt(),
      agencyName: json['agency_name'] as String?,
      cityName: json['city_name'] as String?,
      agencyAddress: json['agency_address'] as String?,
      agencyPhone: json['agency_phone'] as String?,
      phone: (json['phone'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      agencyAvatar: $enumDecodeNullable(
        _$AgencyAvatarEnumMap,
        json['agency_avatar'],
      ),
      agencyLat: json['agency_lat'] as String?,
      agencyLng: json['agency_lng'] as String?,
      morningTime: json['morning_time'] as String?,
      nightTime: json['night_time'] as String?,
      agencyDepartureTimes: (json['agency_departure_times'] as List<dynamic>?)
          ?.map((e) => DepartureTimeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgencyByCityModelToJson(AgencyByCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agency_name': instance.agencyName,
      'city_name': instance.cityName,
      'agency_address': instance.agencyAddress,
      'agency_phone': instance.agencyPhone,
      'phone': instance.phone,
      'agency_avatar': _$AgencyAvatarEnumMap[instance.agencyAvatar],
      'agency_lat': instance.agencyLat,
      'agency_lng': instance.agencyLng,
      'morning_time': instance.morningTime,
      'night_time': instance.nightTime,
      'agency_departure_times': instance.agencyDepartureTimes,
    };

const _$AgencyAvatarEnumMap = {
  AgencyAvatar
          .AVATAR_KBZWBO_L5_U_HGH_GDE_JY_TY_JR_E_WD_WW_WFW1_DLK_JXD_CRWL_JPG:
      '/avatar/KbzwboL5uHghGdeJyTyJrEWdWwWfw1DlkJXDCrwl.jpg',
  AgencyAvatar.EMPTY: '',
};
