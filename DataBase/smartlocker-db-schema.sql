CREATE DATABASE SMARTLOCKERSYSTEM;
USE SMARTLOCKERSYSTEM;

CREATE TABLE Role(
    RoleID char(60) not null PRIMARY KEY,
    RoleName char(60)
);

CREATE TABLE User(
	UserName char(60),
	UserEmail char(100),
    UserID char(60) not null,
    Password char(255),
    MobileNumber char(20),
    UserRoleID char(60),

    PRIMARY KEY(UserID), 
    FOREIGN KEY(UserRoleID) REFERENCES Role(RoleID) ON DELETE CASCADE 
);

CREATE TABLE Location(
	LocationID char(60),
    Longitude char(60),
    Latitude char(60),
    LocationDescription char(60),
    
	PRIMARY KEY(LocationID)
);

CREATE TABLE Locker(
	LockerID char(60),
    LockerUserID char(60),
    LockerLocationId char(60),
    ClusterID char(60),
    Availability boolean,
    IsEmpty boolean,
    OneTimeToken char(60),
    SharedOneTimeToken char(60),
    LockerNumber int,
    ExpireDate DATETIME,
    
    PRIMARY KEY(LockerID),
    FOREIGN KEY(LockerUserID) REFERENCES User(UserID),
    FOREIGN KEY(LockerLocationID) REFERENCES Location(LocationID)
);