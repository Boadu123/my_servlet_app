package com.example.web.database;

public class User {
    int id;
    String firstName;
    String lastName;
    String MobileNumber;

    public User(int id, String firstName, String lastName, String MobileNumber){
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.MobileNumber = MobileNumber;
    }

    public User(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setMobileNumber(String mobileNumber) {
        MobileNumber = mobileNumber;
    }

    public String getMobileNumber() {
        return MobileNumber;
    }
}
