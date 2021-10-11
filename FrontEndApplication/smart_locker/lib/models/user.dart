class User {
  String userName;
  String userEmail;
  String userID;
  String password;
  String mobileNumber;
  String userRoleID;

  User(
    this.userName,
    this.userEmail,
    this.userID,
    this.password,
    this.mobileNumber,
    this.userRoleID,
  );

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'userEmail': userEmail,
        'userID': userID,
        'password': password,
        'mobileNumber': mobileNumber,
        'userRoleID': userRoleID
      };

  User.fromJson(Map<String, dynamic> json) {
    userName=json['userName'],
    userEmail=json['userEmail'],
    userID=json['userID'],
    password;
    mobileNumber;
    userRoleID;
  }
}
