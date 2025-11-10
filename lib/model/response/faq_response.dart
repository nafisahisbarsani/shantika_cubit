// lib/model/response/faq_response.dart

import 'package:json_annotation/json_annotation.dart';
import '../faq_model.dart';

part 'faq_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FaqResponse {
  @JsonKey(name: 'code')
  int? code;

  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'faqs')
  List<FaqModel>? faqs;

  FaqResponse({
    this.code,
    this.success,
    this.message,
    this.faqs,
  });

  factory FaqResponse.fromJson(Map<String, dynamic> json) =>
      _$FaqResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FaqResponseToJson(this);
}