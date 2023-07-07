import 'package:equatable/equatable.dart';

class UserClass extends Equatable {
  final int id;
  final String email;
  final String nickname;

  const UserClass({
    required this.id,
    required this.email,
    required this.nickname,
  });

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["id"] ?? '-',
        email: json["email"] ?? '-',
        nickname: json["nickname"] ?? '-',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nickname": nickname,
      };

  @override
  List<Object?> get props => [id, email, nickname];
}
