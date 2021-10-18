import 'package:json_annotation/json_annotation.dart';
import 'package:smart_locker/models/LocationsModel.dart';
import 'package:smart_locker/models/PurchasedLockersModel.dart';
import 'package:smart_locker/models/UserDataModel.dart';

part 'UserModel.g.dart';

@JsonSerializable()
class UserModel {
  List<LocationsModel>? locations;
  UserDataModel? userData;
  List<PurchasedLockersModel>? purchasedLockers;
  UserModel({this.locations, this.userData, this.purchasedLockers});
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
