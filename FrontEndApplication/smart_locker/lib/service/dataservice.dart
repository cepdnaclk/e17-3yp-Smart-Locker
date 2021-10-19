import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:smart_locker/models/LocationsModel.dart';
import 'package:smart_locker/models/PurchasedLockersModel.dart';
import 'package:smart_locker/models/UserModel.dart';

class DataService extends ChangeNotifier {
  static UserModel user = UserModel();
  static List<LocationsModel> location = [];
  static List<PurchasedLockersModel> purchedLockers = [];
  static String ip = "http://18.234.52.63:3000";
}
