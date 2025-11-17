// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure_time_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartureTimeModel _$DepartureTimeModelFromJson(Map<String, dynamic> json) =>
    DepartureTimeModel(
      id: (json['id'] as num?)?.toInt(),
      agencyId: (json['agency_id'] as num?)?.toInt(),
      departureAt: json['departure_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      timeClassificationId: (json['time_classification_id'] as num?)?.toInt(),
      timeName: json['time_name'] as String?,
      timeClassification: json['time_classification'] == null
          ? null
          : TimeClassificationModel.fromJson(
              json['time_classification'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$DepartureTimeModelToJson(DepartureTimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agency_id': instance.agencyId,
      'departure_at': instance.departureAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'time_classification_id': instance.timeClassificationId,
      'time_name': instance.timeName,
      'time_classification': instance.timeClassification?.toJson(),
    };
