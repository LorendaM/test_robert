import 'dart:convert';

UserModel userInAppFromJson(String str) => UserModel.fromJson(json.decode(str));

String userInAppToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.token,
  });

  int id;
  String username;
  String password;
  String token;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "token": token,
  };
}
