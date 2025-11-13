import 'package:json_annotation/json_annotation.dart';

part 'agency_model.g.dart';

@JsonSerializable()
class AgencyModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;

  AgencyModel({this.id, this.name});

  factory AgencyModel.fromJson(Map<String, dynamic> json) =>
      _$AgencyModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgencyModelToJson(this);
}
