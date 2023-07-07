import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final bool success;
  final String message;
  final Result result;
  final String token;
  final List<dynamic> errors;
  final int status;

  const User({
    required this.success,
    required this.message,
    required this.result,
    required this.token,
    required this.errors,
    required this.status,
  });

  static const empty = const User(
    token: '',
    errors: [],
    message: '',
    result: Result.empty,
    status: -1,
    success: false,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json["success"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
        token: json["token"],
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "result": result.toJson(),
        "token": token,
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "status": status,
      };
}

class Result {
  final int id;
  final String name;
  final String email;
  final String phone;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Result({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  static const empty = const Result(
    id: -1,
    name: '',
    phone: '',
    email: '',
    emailVerifiedAt: '',
    createdAt: null,
    updatedAt: null,
  );

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? 1,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        emailVerifiedAt: json["email_verified_at"] ?? "",
        createdAt:
            DateTime.parse(json["created_at"] ?? DateTime.now().toString()),
        updatedAt:
            DateTime.parse(json["updated_at"] ?? DateTime.now().toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
