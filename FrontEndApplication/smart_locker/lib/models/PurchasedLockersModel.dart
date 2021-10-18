import 'package:json_annotation/json_annotation.dart';


part 'PurchasedLockersModel.g.dart';

@JsonSerializable()
class PurchasedLockersModel{
  String? LockerID;
  String? LockerUserID;
  String? LockerLocationID;
  int? Availability;
  int? IsEmpty;
  int? IsLocked;
  String? OneTimeToken;
  String? SharedOneTimeToken;
  int? LockerNumber;
  DateTime? ExpireDate; 
  PurchasedLockersModel({this.LockerID, this.LockerUserID, this.LockerLocationID, this.Availability, this.IsEmpty,
  this.OneTimeToken, this.SharedOneTimeToken, this.LockerNumber, this.ExpireDate});
  factory PurchasedLockersModel.fromJson(Map<String, dynamic> json) => _$PurchasedLockersModelFromJson(json);
  Map<String, dynamic> toJson() => _$PurchasedLockersModelToJson(this);

}