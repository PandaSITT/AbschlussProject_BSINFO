package com.bsinfo.AbschlussProject.entities;

import javax.persistence.Entity;

@Entity
class UserEntity{
private int id;
private String benutzerName;

}

public void UserEntity(){

}


/*
CREATE TABLE User (
	U_ID int PRIMARY KEY AUTO_INCREMENT,
    U_Benutzername varchar(255) UNIQUE NOT NULL,
    U_Email varchar(255),
    U_Vorname varchar(255),
    U_Nachname varchar(255),
    U_Geschlecht_ID int,
    U_Rolle_ID int NOT NULL,
*/