import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/info_agen_model.dart';

part 'info_agen_response.g.dart';

@JsonSerializable(explicitToJson: true)
class InfoAgenResponse {
  final int? code;
  final bool? success;
  final String? message;
  final List<InfoAgenModel>? agencies;

  InfoAgenResponse({
    this.code,
    this.success,
    this.message,
    this.agencies,
  });

  factory InfoAgenResponse.fromJson(Map<String, dynamic> json) =>
      _$InfoAgenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InfoAgenResponseToJson(this);
}
