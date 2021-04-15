package com.bsinfo.AbschlussProject.entities;

public class PasswortEntity {
    private String passwort;
    private int uerId;

    public PasswortEntity(String passwort, int uerId) {
        this.passwort = passwort;
        this.uerId = uerId;
    }

    public String getPasswort() {
        return passwort;
    }

    public void setPasswort(String passwort) {
        this.passwort = passwort;
    }

    public int getUerId() {
        return uerId;
    }

    public void setUerId(int uerId) {
        this.uerId = uerId;
    }
}
