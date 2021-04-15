package com.bsinfo.AbschlussProject.entities;
import org.springframework.lang.NonNull;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name="User")
@Entity
public class UserEntiye{
    @Id
    @Column(name = "U_ID")
    private int id;
    @Column(name = "U_Benutzername")
    private String benutzerName;
    @Column(name = "U_Email")
    private String eMail;
    @Column(name = "U_Vorname")
    private String vorname;
    @Column(name = "U_Nachname")
    private String nachname;
    @Column(name = "U_Geschlecht_ID")
    private int geschlechtId;
    @Column(name = "U_Rolle_ID")
    private int rolleId;


    public UserEntiye( String benutzerName, String eMail, String vorname, String nachname, int geschlechtId, int rolleId) {
        this.benutzerName = benutzerName;
        this.eMail = eMail;
        this.vorname = vorname;
        this.nachname = nachname;
        this.geschlechtId = geschlechtId;
        this.rolleId = rolleId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBenutzerName() {
        return benutzerName;
    }

    public void setBenutzerName(String benutzerName) {
        this.benutzerName = benutzerName;
    }

    public String geteMail() {
        return eMail;
    }

    public void seteMail(String eMail) {
        this.eMail = eMail;
    }

    public String getVorname() {
        return vorname;
    }

    public void setVorname(String vorname) {
        this.vorname = vorname;
    }

    public String getNachname() {
        return nachname;
    }

    public void setNachname(String nachname) {
        this.nachname = nachname;
    }

    public int getGeschlechtId() {
        return geschlechtId;
    }

    public void setGeschlechtId(int geschlechtId) {
        this.geschlechtId = geschlechtId;
    }

    public int getRolleId() {
        return rolleId;
    }

    public void setRolleId(int rolleId) {
        this.rolleId = rolleId;
    }
}