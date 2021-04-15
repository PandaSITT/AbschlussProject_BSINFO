-- Flag Data
insert into Geschlecht(G_Name, G_Anrede) value
('Mänlich', 'Herr'),
('Weiblich', 'Frau'),
('Divers', '*');
insert into User_Rolle(UR_Name) value
('Admin'),
('User');

-- User
insert into User(U_Benutzername, U_Vorname, U_Nachname, U_Geschlecht_ID, U_Rolle_ID) value
('Admin', NULL, NULL, NULL, 1),
('LucaMa', 'Luca', 'Marino', 1, 1),
('LuisFr', 'Luis', 'Frey', 1, 0);



-- Beispiel

-- Trigger tragt R_User_Manager_ID in Raum_User ein
insert into Raeume(R_Name, R_User_Manager_ID)
Value("Beispiel", 3);