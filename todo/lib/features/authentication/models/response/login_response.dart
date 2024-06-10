class LoginResponse {
  final String token;
  final String refreshToken;

  LoginResponse(this.token, this.refreshToken);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      LoginResponse(json['token'], json['refreshToken']);
}