import 'package:json_annotation/json_annotation.dart';
import 'package:practicing_http/LocationsModel.dart';
import 'package:practicing_http/PurchasedLockersModel.dart';
import 'package:practicing_http/UserDataModel.dart';


part 'UserModel.g.dart';

@JsonSerializable()
class UserModel{
  List<LocationsModel>? locations;
  UserDataModel? userData;
  List<PurchasedLockersModel>? purchasedLockers;
  UserModel({this.locations, this.userData, this.purchasedLockers});
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}