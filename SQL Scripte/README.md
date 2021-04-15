# SQL - Datenbank

## Entity Relationship Model

<img src="C:\Users\luisf\source\repos\AbschlussProject_BSINFO\SQL Scripte\README.assets\image-20210415210648789.png" alt="image-20210415210648789" style="zoom: 80%;" />

## Insert Schema

### User
```
INSERT INTO User (U_Benutzername, U_Rolle_ID, U_Email, U_Vorname, U_Nachname, U_Geschlecht_ID, )
Values(<Werte>);

Optional:
- U_Email
- U_Vorname
- U_Nachname
- U_Geschlecht_ID
```


### Raum
```
INSERT INTO User (R_Name, R_User_Manager_ID)
Values(<Werte>);
```
Der R_User_Manager_ID wird per Trigger automatisch in die Raum Benutzer tabelle eingetragen.


### Raum Benutzer
```
INSERT INTO User (RU_Raum_ID, RU_User_ID, RU_Raum_Admin)
Values(<Werte>);

Optional:
- RU_Raum_Admin
```


### Content
```
INSERT INTO User (C_Raum_ID, C_User_Creator_ID, C_Text, C_Pinned)
Values(<Werte>);

Optional:
- C_Pinned
```