import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/terms_model.dart';

part 'terms_response.g.dart';

@JsonSerializable()
class TermsResponse {
  @JsonKey(name: "term_and_condition")
  final TermsModel? terms;

  TermsResponse({this.terms});

  factory TermsResponse.fromJson(Map<String, dynamic> json) =>
      _$TermsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TermsResponseToJson(this);
}
