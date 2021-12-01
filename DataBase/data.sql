USE mou;

INSERT INTO Location
VALUES ('1',  80.59256273092281, 7.252321246065113,'UOP Efac', "https://goo.gl/maps/ncdpqV7tHDCKQo7P6"),
('2', 80.59304870962823, 7.2633009032347084,'Peradeniya', "https://goo.gl/maps/ptw5G45RBmesS7WR9"),
('3', 80.35434588675535, 7.500439419700166, 'Welagedara Uyana', "https://goo.gl/maps/N6tHfaRQpEtSC2H19"),
('4',  80.36506196282511, 7.486856035183058, 'Kurunegala', "https://goo.gl/maps/7M4LuFhPzBZVqsjt6"),
('5',  80.63105223125596, 7.289957094796318, 'Kandy', 'https://goo.gl/maps/9D6kxbB46Q2EdhKc7');

INSERT INTO Locker(LockerID, LockerLocationID, ClusterID, Availability, IsEmpty, IsLocked, LockerNumber)
	VALUES ('1','1','1', true, true, true, '1'),
    ('2','1','1', true, true, true, '2'),
    ('3','1','1', true, true, true, '3'),
    ('4','1','1', true, true, true, '4'),
    ('5','2','2', true, true, true, '1'),
    ('6','2','2', true, true, true, '2'),
    ('7','2','2', true, true, true, '3'),
    ('8','2','2', true, true, true, '4'),
    ('9','3','3', true, true, true, '1'),
    ('10','3','3', true, true, true, '2'),
    ('11','3','3', true, true, true, '3'),
    ('12','3','3', true, true, true, '4'),
    ('13','4','4', true, true, true, '1'),
    ('14','4','4', true, true, true, '2'),
    ('15','4','4', true, true, true, '3'),
    ('16','4','4', true, true, true, '4'),
    ('17','5','5', true, true, true, '1'),
    ('18','5','5', true, true, true, '2'),
    ('19','5','5', true, true, true, '3'),
    ('20','5','5', true, true, true, '4');

INSERT INTO Role
	VALUES ('1', 'User'),
    ('2', 'Admin');

UPDATE Locker 
    SET 
    Availability=false, ExpireDate="", LockerUserID="4fbc91eb-f0d2-4c48-8f7e-200d12e832ef", OneTimeToken="ABCD4556xx", SharedOneTimeToken="ABCD4556xx" WHERE LockerID="1";


UPDATE Locker 
    SET 
    Availability=false, ExpireDate="2021:12:18 11:00:00", LockerUserID="4fbc91eb-f0d2-4c48-8f7e-200d12e832ef", OneTimeToken="ABCD4556xx", SharedOneTimeToken="ABCD4556xx" WHERE LockerID="3";
   
