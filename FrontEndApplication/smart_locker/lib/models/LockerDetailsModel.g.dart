// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LockerDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LockerDetailsModel _$LockerDetailsModelFromJson(Map<String, dynamic> json) {
  return LockerDetailsModel(
    lockerdetails: (json['lockerdetails'] as List<dynamic>?)
        ?.map((e) => PurchasedLockersModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    location: (json['location'] as List<dynamic>?)
        ?.map((e) => LocationsModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$LockerDetailsModelToJson(LockerDetailsModel instance) =>
    <String, dynamic>{
      'lockerdetails': instance.lockerdetails,
      'location': instance.location,
    };
