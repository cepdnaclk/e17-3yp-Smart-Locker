// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    locations: (json['locations'] as List<dynamic>?)
        ?.map((e) => LocationsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    userData: json['userData'] == null
        ? null
        : UserDataModel.fromJson(json['userData'] as Map<String, dynamic>),
    purchasedLockers: (json['purchasedLockers'] as List<dynamic>?)
        ?.map((e) => PurchasedLockersModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'locations': instance.locations,
      'userData': instance.userData,
      'purchasedLockers': instance.purchasedLockers,
    };
