// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PurchasedLockersModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurchasedLockersModel _$PurchasedLockersModelFromJson(
    Map<String, dynamic> json) {
  return PurchasedLockersModel(
    LockerID: json['LockerID'] as String?,
    LockerUserID: json['LockerUserID'] as String?,
    LockerLocationID: json['LockerLocationID'] as String?,
    Availability: json['Availability'] as int?,
    IsEmpty: json['IsEmpty'] as int?,
    OneTimeToken: json['OneTimeToken'] as String?,
    SharedOneTimeToken: json['SharedOneTimeToken'] as String?,
    LockerNumber: json['LockerNumber'] as int?,
    ExpireDate: json['ExpireDate'] == null
        ? null
        : DateTime.parse(json['ExpireDate'] as String),
  )..IsLocked = json['IsLocked'] as int?;
}

Map<String, dynamic> _$PurchasedLockersModelToJson(
        PurchasedLockersModel instance) =>
    <String, dynamic>{
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
