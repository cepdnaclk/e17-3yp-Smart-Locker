// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDataModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) {
  return UserDataModel(
    UserName: json['UserName'] as String?,
    UserEmail: json['UserEmail'] as String?,
    UserID: json['UserID'] as String?,
    MobileNumber: json['MobileNumber'] as String?,
    UserRoleID: json['UserRoleID'] as String?,
  );
}

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'UserName': instance.UserName,
      'UserEmail': instance.UserEmail,
      'UserID': instance.UserID,
      'MobileNumber': instance.MobileNumber,
      'UserRoleID': instance.UserRoleID,
    };
