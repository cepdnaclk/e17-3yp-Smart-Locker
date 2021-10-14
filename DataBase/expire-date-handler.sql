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
    DO
      CALL checking_expire();