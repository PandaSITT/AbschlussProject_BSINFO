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
('LucaMa', 'Luca', 'Marino', 2, 1),
('LuisFr', 'Luis', 'Frey', 1, 1);