import 'package:json_annotation/json_annotation.dart';


part 'LockerLocationDetailsModel.g.dart';

@JsonSerializable()
class LockerLocationDetailsModel {
  
  String? LocationID;
  String? Longitude;
  String? Latitude;
  String? LocationDescription;
  String? LocationUrl;
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

  LockerLocationDetailsModel({this.LocationID, this.Longitude, this.Latitude, this.LocationDescription, this.LocationUrl,
  this.LockerID, this.LockerUserID, this.LockerLocationID, this.Availability, this.IsEmpty,this.IsLocked,this.OneTimeToken, 
  this.SharedOneTimeToken, this.LockerNumber, this.ExpireDate});
  factory LockerLocationDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$LockerLocationDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$LockerLocationDetailsModelToJson(this);
}
