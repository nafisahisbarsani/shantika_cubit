import 'package:json_annotation/json_annotation.dart';
import '../user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthResponse {
  @JsonKey(name: "code")
  final int? code;

  @JsonKey(name: "success")
  final bool? success;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "user")
  final UserModel? user;

  @JsonKey(name: "token")
  final String? token;

  AuthResponse({
    this.code,
    this.success,
    this.message,
    this.user,
    this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}