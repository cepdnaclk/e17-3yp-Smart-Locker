USE SMARTLOCKERSYSTEM;
SET GLOBAL time_zone = "+05:30";
SET GLOBAL event_scheduler = ON;

DROP PROCEDURE IF EXISTS checking_expire;
DELIMITER $$
CREATE PROCEDURE checking_expire()
BEGIN
	UPDATE Locker
		SET Availability = true WHERE ExpireDate <= NOW();
END$$
DELIMITER ;

DROP EVENT IF EXISTS setAvailability;
CREATE EVENT setAvailability
    ON SCHEDULE EVERY 1 SECOND
    STARTS NOW()
    DO
      CALL checking_expire();

DROP PROCEDURE IF EXISTS erase_loginrecords;
DELIMITER $$
CREATE PROCEDURE erase_loginrecords()
BEGIN
	DELETE FROM Login;
END$$
DELIMITER ;

DROP EVENT IF EXISTS erase_event;
CREATE EVENT erase_event
    ON SCHEDULE EVERY 24 HOUR
    STARTS NOW()
    DO
      CALL erase_loginrecords;
