import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:smart_locker/models/LocationsModel.dart';
import 'package:smart_locker/models/LockerLocationDetailsModel.dart';
import 'package:smart_locker/models/PurchasedLockersModel.dart';
import 'package:smart_locker/models/UserModel.dart';

class DataService extends ChangeNotifier {
  static UserModel user = UserModel();
  static List<LocationsModel> location = [];
  static List<PurchasedLockersModel> purchedLockers = [];
  static List<LockerLocationDetailsModel> userLockers = [];
  static List<PurchasedLockersModel> avilableLockers = [];
  static String ip = "http://34.227.193.145:3000";
  static String jwt = "";
}
