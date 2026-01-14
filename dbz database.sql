
DROP SCHEMA IF EXISTS DragonBallZ;
CREATE SCHEMA IF NOT EXISTS DragonBallZ;
USE DragonBallZ;



CREATE TABLE Characters(
CharacterID INT AUTO_INCREMENT PRIMARY KEY,
Label VARCHAR(100) NOT NULL,
Gender ENUM ('Male','Female') NOT NULL,
Species VARCHAR(50) NOT NULL);

INSERT INTO Characters(Label,Gender,Species)VALUES
('Goku', 'Male', 'Saiyan'),
('Vegeta', 'Male', 'Saiyan'),
('Bulma', 'Female', 'Earthling'),
('Piccolo', 'Male', 'Namekian'),
('Gohan', 'Male', 'Saiyan'),
('Chi-Chi', 'Female', 'Earthling');


CREATE TABLE Techniques (
    TechniqueID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Type VARCHAR(100),  -- e.g., Ki Blast, Martial Arts
    Description TEXT
);

INSERT INTO Techniques (Name, Type, Description) VALUES
('Kamehameha', 'Ki Blast', 'A powerful energy wave technique.'),
('Final Flash', 'Ki Blast', 'A massive energy attack used by Vegeta.'),
('Galick Gun', 'Ki Blast', 'A powerful energy attack.'),
('Smarts', 'Intelligence', 'Known for incredible intelligence and inventing.'),
('Special Beam Cannon', 'Ki Blast', 'A powerful piercing attack.'),
('Masenko', 'Energy Blast', 'An energy blast placed above the head before firing.'),
('Martial Arts', 'Hand-to-Hand', 'Skilled hand-to-hand combat.');

CREATE TABLE CharacterTechniques (
    CharacterID INT,
    TechniqueID INT,
    PRIMARY KEY (CharacterID, TechniqueID),
    FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID),
    FOREIGN KEY (TechniqueID) REFERENCES Techniques(TechniqueID)
);

INSERT INTO CharacterTechniques (CharacterID, TechniqueID) VALUES
    ((SELECT CharacterID FROM Characters WHERE Label = 'Goku'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Kamehameha')),
    ((SELECT CharacterID FROM Characters WHERE Label = 'Vegeta'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Galick Gun')),
	((SELECT CharacterID FROM Characters WHERE Label = 'Vegeta'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Final Flash')),
    ((SELECT CharacterID FROM Characters WHERE Label = 'Bulma'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Smarts')),
    ((SELECT CharacterID FROM Characters WHERE Label = 'Piccolo'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Special Beam Cannon')),
    ((SELECT CharacterID FROM Characters WHERE Label = 'Gohan'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Masenko')),
    ((SELECT CharacterID FROM Characters WHERE Label = 'Gohan'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Special Beam Cannon')),
    ((SELECT CharacterID FROM Characters WHERE Label = 'Gohan'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Kamehameha')),
    ((SELECT CharacterID FROM Characters WHERE Label = 'Chi-Chi'), (SELECT TechniqueID FROM Techniques WHERE Name = 'Martial Arts'));


  CREATE TABLE PowerLevel (
       CharacterID INT PRIMARY KEY AUTO_INCREMENT,
       CharacterName VARCHAR(50) NOT NULL,
       PowerLevel BIGINT NOT NULL,  -- Use BIGINT for very large numbers
       FOREIGN KEY (CharacterID) REFERENCES Characters(CharacterID)
       );

  INSERT INTO PowerLevel (CharacterName, PowerLevel) VALUES
   ('Goku', 100000000000),    -- Goku's presumed power level post-Tournament of Power
   ('Vegeta', 95000000000),   -- Vegeta's presumed power level post-Tournament of Power
   ('Piccolo', 10000000000),  -- Piccolo's power level considering his training and enhancements
   ('Gohan', 75000000000),    -- Gohan's power level after his training and involvement in the Tournament of Power
   ('Chi-Chi', 1000),         -- Chi-Chi's power level for narrative purposes, as she's primarily non-combatant
   ('Bulma', 10);             -- Bulma's power level for narrative purposes