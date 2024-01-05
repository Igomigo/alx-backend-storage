-- A SQL script that creates a stored procedure AddBonus that adds a new correction for a stud   ent.
-- Requirements:

-- Procedure AddBonus is taking 3 inputs (in this order):
--    user_id, a users.id value (you can assume user_id is linked to an existing users)
--    project_name, a new or already exists projects - if no projects.name found in the table,      you should create it
--    score, the score value for the correction

DELIMITER $$
DROP PROCEDURE IF EXISTS AddBonus;
CREATE PROCEDURE AddBonus(
	IN `user_id` INTEGER,
	IN `project_name` VARCHAR(255),
	IN `score` INTEGER
)
BEGIN
    INSERT INTO projects (name)
    SELECT project_name
    -- WHERE NOT EXISTS (SELECT * FROM projects WHERE name=project_name LIMIT 1);
    WHERE project_name NOT IN (SELECT name FROM projects);

    INSERT INTO corrections (user_id, project_id, score)
    VALUES(user_id, (SELECT id from projects WHERE name=project_name), score);
END $$
DELIMITER ;$$
