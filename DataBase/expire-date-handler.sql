USE SMARTLOCKERSYSTEM;
 
DELIMITER $$
DROP PROCEDURE IF EXISTS checking_expire;
CREATE PROCEDURE checking_expire()
BEGIN
	UPDATE locker
		SET Availability = true WHERE ExpireDate <= NOW();
END$$
DELIMITER ;

DROP EVENT IF EXISTS setAvailability;
CREATE EVENT setAvailability
    ON SCHEDULE EVERY 1 SECOND
    DO
      CALL checking_expire();