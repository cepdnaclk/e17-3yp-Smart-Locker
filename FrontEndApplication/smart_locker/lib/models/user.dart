import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.userName,
    this.userEmail,
    this.userId,
    this.password,
    this.mobileNumber,
    this.userRoleId,
  });

  String? userName;
  String? userEmail;
  String? userId;
  String? password;
  String? mobileNumber;
  String? userRoleId;

  factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
        userEmail: json["userEmail"],
        userId: json["userID"],
        password: json["password"],
        mobileNumber: json["mobileNumber"],
        userRoleId: json["userRoleID"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userEmail": userEmail,
        "userID": userId,
        "password": password,
        "mobileNumber": mobileNumber,
        "userRoleID": userRoleId,
      };
}
