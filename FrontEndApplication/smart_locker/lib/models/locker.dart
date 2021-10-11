import 'dart:convert';

class Locker {
  String lockerID;
  String lockerUserID;
  String lockerLocationID;
  String clusterID;
  bool availability;
  bool isEmpty;
  String oneTimeToken;
  String sharedOneTimeToken;
  int lockerNumber;
  DateTime expireDate;

  Locker(
    this.lockerID,
    this.lockerUserID,
    this.lockerLocationID,
    this.clusterID,
    this.availability,
    this.isEmpty,
    this.oneTimeToken,
    this.sharedOneTimeToken,
    this.lockerNumber,
    this.expireDate,
  );
}
