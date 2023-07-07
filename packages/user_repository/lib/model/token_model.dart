class Tokens {
  final String accessToken;
  final String refreshToken;

  const Tokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        accessToken: json["accessToken"] ?? '',
        refreshToken: json["refreshToken"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}
