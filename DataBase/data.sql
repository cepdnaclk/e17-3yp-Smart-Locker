USE SMARTLOCKERSYSTEM;

INSERT INTO Location
VALUES ('1',  80.59256273092281, 7.252321246065113,'UOP Efac', "https://goo.gl/maps/ncdpqV7tHDCKQo7P6"),
('2', 80.59304870962823, 7.2633009032347084,'Peradeniya', "https://goo.gl/maps/ptw5G45RBmesS7WR9");

INSERT INTO Locker(LockerID, LockerLocationID, ClusterID, Availability, IsEmpty, IsLocked, LockerNumber)
	VALUES ('1','1','1', true, true, true, '1'),
    ('2','1','1', true, true, true, '2'),
    ('3','2','2', true, true, true, '1'),
    ('4','2','2', true, true, true, '2');

INSERT INTO Role
	VALUES ('1', 'User'),
    ('2', 'Admin');

UPDATE Locker 
    SET 
    Availability=false, ExpireDate="", LockerUserID="4fbc91eb-f0d2-4c48-8f7e-200d12e832ef", OneTimeToken="ABCD4556xx", SharedOneTimeToken="ABCD4556xx" WHERE LockerID="1";


UPDATE Locker 
    SET 
    Availability=false, ExpireDate="2021:12:18 11:00:00", LockerUserID="4fbc91eb-f0d2-4c48-8f7e-200d12e832ef", OneTimeToken="ABCD4556xx", SharedOneTimeToken="ABCD4556xx" WHERE LockerID="3";
   
