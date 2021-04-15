CREATE Database WebseiteDB;
USE WebseiteDB;

-- Flags
CREATE TABLE Geschlecht (
	G_ID int PRIMARY KEY AUTO_INCREMENT,
    G_Name varchar(255) NOT NULL,
    G_Anrede varchar(255)
);
CREATE TABLE User_Rolle (
	UR_ID int PRIMARY KEY AUTO_INCREMENT,
    UR_Name varchar(255) NOT NULL
);

-- User / Passwort
CREATE TABLE User (
	U_ID int PRIMARY KEY AUTO_INCREMENT,
    U_Benutzername varchar(255) UNIQUE NOT NULL,
    U_Email varchar(255),
    U_Vorname varchar(255),
    U_Nachname varchar(255),
    U_Geschlecht_ID int,
    U_Rolle_ID int NOT NULL,
    FOREIGN KEY(U_Geschlecht_ID) REFERENCES Geschlecht(G_ID),
    FOREIGN KEY(U_Rolle_ID) REFERENCES User_Rolle( UR_ID)
);
CREATE TABLE User_Passwort (
	UP_User_ID int PRIMARY KEY,
    UP_Passwort varchar(255),
    FOREIGN KEY(UP_User_ID) REFERENCES User(U_ID)
);

-- Content
CREATE TABLE Raeume (
	R_ID int PRIMARY KEY AUTO_INCREMENT,
    R_Name varchar(255) NOT NULL,
    R_User_Manager_ID int NOT NULL,
    R_CreateDate timestamp NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY(R_User_Manager_ID) REFERENCES User(U_ID)
);
CREATE TABLE Raum_User (
	RU_Raum_ID int NOT NULL,
    RU_User_ID int NOT NULL,
    RU_Raum_Admin boolean NOT NULL default false,
    FOREIGN KEY(RU_Raum_ID) REFERENCES Raeume(R_ID),
    FOREIGN KEY(RU_User_ID) REFERENCES User(U_ID),
    CONSTRAINT RU_PrimaryKey PRIMARY KEY (RU_Raum_ID, RU_User_ID) 
);
CREATE TABLE Content (
	C_ID int PRIMARY KEY  AUTO_INCREMENT,
    C_Raum_ID int NOT NULL,
    C_User_Creator_ID int NOT NULL,
    C_Text varchar(255) NOT NULL,
    C_Pinned boolean NOT NULL default false,
    C_CreateDate timestamp NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY(C_Raum_ID) REFERENCES Raeume(R_ID),
    FOREIGN KEY(C_User_Creator_ID) REFERENCES User(U_ID)
);

-- View
CREATE VIEW User_Overview AS
select U_ID AS 'User ID',
    U_Benutzername AS 'Benutzername',
    U_Email AS 'Email',
    U_Vorname AS 'Vorname',
    U_Nachname AS 'Nachname',
    G_Name AS 'Geschlecht',
    UR_Name As 'Rolle'
from User
left join User_Rolle on User_Rolle.UR_ID = User.U_Rolle_ID
left join Geschlecht on Geschlecht.G_ID = User.U_Geschlecht_ID;

CREATE VIEW Raum_Overview AS
select R_ID AS 'Raum ID',
R_Name As 'Raum Name',
U_Benutzername AS 'Manager Name',
R_User_Manager_ID AS 'Manager ID',
COUNT(RU_Raum_ID) AS 'User Count',
R_CreateDate As 'Erstellungdatum'
from Raeume
left join User on Raeume.R_User_Manager_ID = User.U_ID
left join Raum_User on Raeume.R_ID = Raum_User.RU_Raum_ID
group by R_ID;

-- Trigger
Create TRIGGER Raum_Add_User
	After Insert On Raeume
    FOR EACH ROW 
	INSERT INTO Raum_User(RU_Raum_ID, RU_User_ID, RU_Raum_Admin)
	value(NEW.R_ID, NEW.R_User_Manager_ID, true);
