import 'package:json_annotation/json_annotation.dart';
import 'package:smart_locker/models/LocationsModel.dart';
import 'package:smart_locker/models/PurchasedLockersModel.dart';

part 'LockerDetailsModel.g.dart';

@JsonSerializable()
class LockerDetailsModel {
  
  List<PurchasedLockersModel>? lockerdetails;
  List<LocationsModel>? location;
  LockerDetailsModel({this.lockerdetails, this.location});
  factory LockerDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$LockerDetailsModelFromJson(json);
  Map<String, dynamic> toJson() => _$LockerDetailsModelToJson(this);
}
