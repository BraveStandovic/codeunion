// import 'dart:convert';

// import 'package:equatable/equatable.dart';

// import 'token_model.dart';
// import 'user_model.dart';

// User userFromJson(String str) => User.fromJson(json.decode(str));

// String userToJson(User data) => json.encode(data.toJson());

// class User extends Equatable {
//   final Tokens tokens;
//   final UserClass user;

//   const User({
//     required this.tokens,
//     required this.user,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         tokens: Tokens.fromJson(json["tokens"]),
//         user: UserClass.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "tokens": tokens.toJson(),
//         "user": user.toJson(),
//       };

//   static const empty = User(
//       tokens: Tokens(accessToken: '-', refreshToken: '-'),
//       user: UserClass(id: -1, email: '-', nickname: '-'));

//   @override
//   List<Object?> get props => [tokens, user];
// }
