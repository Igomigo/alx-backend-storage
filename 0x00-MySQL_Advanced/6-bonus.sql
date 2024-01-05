-- A SQL script that creates a stored procedure AddBonus that adds a new correction for a stud   ent.
-- Requirements:

-- Procedure AddBonus is taking 3 inputs (in this order):
--    user_id, a users.id value (you can assume user_id is linked to an existing users)
--    project_name, a new or already exists projects - if no projects.name found in the table,      you should create it
--    score, the score value for the correction

DELIMITER $$
CREATE PROCEDURE AddBonus (IN user_id INT, IN project_name VARCHAR(40), IN score INT)
BEGIN
   DECLARE pname VARCHAR(40);
   DECLARE proj_id INT;

   -- collect the project name and store in the pname variable
   SELECT name INTO pname FROM projects WHERE name = project_name;

   -- some conditionals to determine the next line of action
   IF pname = NULL THEN
      INSERT INTO projects(name) VALUES(project_name);
      UPDATE correction SET score = score WHERE user_id = user_id
      AND project_id = SELECT id FROM projects WHERE name = project_name;
   ELSEIF project_name = pname THEN
      SELECT id INTO proj_id FROM projects WHERE name = project_name;
      INSERT INTO correction(user_id, project_id, score) VALUES(user_id, proj_id, score);
   END IF;
END $$
DELIMITER ;
