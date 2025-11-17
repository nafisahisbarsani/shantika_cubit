import 'package:json_annotation/json_annotation.dart';
import 'time_classification_model.dart';

part 'departure_time_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DepartureTimeModel {
  final int? id;
  @JsonKey(name: 'agency_id')
  final int? agencyId;
  @JsonKey(name: 'departure_at')
  final String? departureAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'time_classification_id')
  final int? timeClassificationId;
  @JsonKey(name: 'time_name')
  final String? timeName;
  @JsonKey(name: 'time_classification')
  final TimeClassificationModel? timeClassification;

  DepartureTimeModel({
    this.id,
    this.agencyId,
    this.departureAt,
    this.createdAt,
    this.updatedAt,
    this.timeClassificationId,
    this.timeName,
    this.timeClassification,
  });

  factory DepartureTimeModel.fromJson(Map<String, dynamic> json) =>
      _$DepartureTimeModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartureTimeModelToJson(this);
}
