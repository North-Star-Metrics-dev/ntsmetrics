class SignUpRequest {
  final String email;
  final String password;
  final String confirmpassword;
  final String phone;
  final String countryCode;
  final String captcha;

  SignUpRequest({
    required this.email,
    required this.password,
    required this.confirmpassword,
    required this.phone,
    required this.countryCode,
    required this.captcha,
  });
}
