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