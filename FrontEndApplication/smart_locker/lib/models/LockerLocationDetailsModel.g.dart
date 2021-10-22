// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LockerLocationDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LockerLocationDetailsModel _$LockerLocationDetailsModelFromJson(
    Map<String, dynamic> json) {
  return LockerLocationDetailsModel(
    LocationID: json['LocationID'] as String?,
    Longitude: json['Longitude'] as String?,
    Latitude: json['Latitude'] as String?,
    LocationDescription: json['LocationDescription'] as String?,
    LocationUrl: json['LocationUrl'] as String?,
    LockerID: json['LockerID'] as String?,
    LockerUserID: json['LockerUserID'] as String?,
    LockerLocationID: json['LockerLocationID'] as String?,
    Availability: json['Availability'] as int?,
    IsEmpty: json['IsEmpty'] as int?,
    IsLocked: json['IsLocked'] as int?,
    OneTimeToken: json['OneTimeToken'] as String?,
    SharedOneTimeToken: json['SharedOneTimeToken'] as String?,
    LockerNumber: json['LockerNumber'] as int?,
    ExpireDate: json['ExpireDate'] == null
        ? null
        : DateTime.parse(json['ExpireDate'] as String),
  );
}

Map<String, dynamic> _$LockerLocationDetailsModelToJson(
        LockerLocationDetailsModel instance) =>
    <String, dynamic>{
      'LocationID': instance.LocationID,
      'Longitude': instance.Longitude,
      'Latitude': instance.Latitude,
      'LocationDescription': instance.LocationDescription,
      'LocationUrl': instance.LocationUrl,
      'LockerID': instance.LockerID,
      'LockerUserID': instance.LockerUserID,
      'LockerLocationID': instance.LockerLocationID,
      'Availability': instance.Availability,
      'IsEmpty': instance.IsEmpty,
      'IsLocked': instance.IsLocked,
      'OneTimeToken': instance.OneTimeToken,
      'SharedOneTimeToken': instance.SharedOneTimeToken,
      'LockerNumber': instance.LockerNumber,
      'ExpireDate': instance.ExpireDate?.toIso8601String(),
    };
