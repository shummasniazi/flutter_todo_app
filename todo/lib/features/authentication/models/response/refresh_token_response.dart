class RefreshResponse {
  final String token;
  final String refreshToken;

  RefreshResponse(this.token, this.refreshToken);

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      RefreshResponse(json['token'], json['refreshToken']);
}