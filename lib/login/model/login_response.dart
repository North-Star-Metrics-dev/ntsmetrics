import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String message;
  final String code;

  LoginResponse({
    required this.message,
    required this.code,
  });

  // Factory constructor to create an instance from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
