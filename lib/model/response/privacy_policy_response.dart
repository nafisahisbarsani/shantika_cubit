import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/policy_model.dart';

part 'privacy_policy_response.g.dart';

@JsonSerializable()
class PrivacyPolicyResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "privacy_policy")
  PrivacyPolicyModel? privacyPolicy;

  PrivacyPolicyResponse({
    this.code,
    this.success,
    this.message,
    this.privacyPolicy,
  });

  factory PrivacyPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyPolicyResponseToJson(this);
}
