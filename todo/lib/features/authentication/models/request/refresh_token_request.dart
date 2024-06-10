
class RefreshRequest {
  final String refreshToken;

  RefreshRequest(this.refreshToken);

  Map<String, dynamic> toJson() => {
    "refreshToken": refreshToken,
  };
}