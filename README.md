# AbschlussProject_BSINFO

## BUILD
```
./gradlew bootRun
ng serve
```





## Entwicklungsumgebung einrichten

```
sudo -s
add-apt-repository ppa:cwchien/gradle
apt-get update
apt install gradle
apt install NPM
npm install npm -g
npm update npm -g
```


## MySQL einrichten

User: BackendUserDB

```
sudo apt install mysql-server -y
sudo mysql
# alternativ mysql -uroot -p<root password>

CREATE USER IF NOT EXISTS 'BackendUserDB'@'localhost' IDENTIFIED BY '<neuer Benutzer Passwort>';
GRANT ALL PRIVILEGES ON *.* TO 'BackendUserDB'@'localhost';
CREATE Database WebseiteDB;
```
