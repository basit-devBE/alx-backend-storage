-- create a script to store a procedure 
-- that adds a new correction for a student
-- the procedure must receive 3 arguments:
-- student_id: INT
DROP PROCEDURE IF EXISTS AddBonus;
DELIMITER $$
CREATE PROCEDURE AddBonus(user_id INT,project_name VARCHAR(255),score FLAT)
BEGIN
    DECLARE project_id INT;
    DECLARE user_id INT;
    DECLARE score FLOAT;
    DECLARE project_name VARCHAR(255);
    SELECT id INTO project_id FROM projects WHERE name = project_name;
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, project_id, score);
END $$
DELIMITER ;