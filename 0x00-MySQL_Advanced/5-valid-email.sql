-- create a trigger to validate email
-- if the email is invalid, the record should not be inserted
DROP TRIGGER IF EXISTS validate_email;
DELIMITER $$
CREATE TRIGGER validate_email
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN 
    IF OLD.email != NEW.email THEN
        SET NEW.valid.email = 0;
    ELSE
        SET NEW.valid.email = NEW.valid.email;
    END IF;
END $$
DELIMITER ;