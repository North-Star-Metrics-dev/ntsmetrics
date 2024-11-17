class LoginRequest {
  final String email;
  final String password;
  final String captcha;

  LoginRequest({
    required this.email,
    required this.password,
    required this.captcha,
  });

 
  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      email: json['email'],
      password: json['password'],
      captcha: json['captcha'],
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'captcha': captcha,
    };
  }
}
