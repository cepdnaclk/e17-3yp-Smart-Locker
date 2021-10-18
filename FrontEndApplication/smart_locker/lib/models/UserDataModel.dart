import 'package:json_annotation/json_annotation.dart';


part 'UserDataModel.g.dart';

@JsonSerializable()
class UserDataModel{
  String? UserName;
  String? UserEmail;
  String? UserID;
  String? MobileNumber;
  String? UserRoleID;
  UserDataModel({this.UserName, this.UserEmail, this.UserID, this.MobileNumber, this.UserRoleID});
  factory UserDataModel.fromJson(Map<String, dynamic> json) => _$UserDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);

}