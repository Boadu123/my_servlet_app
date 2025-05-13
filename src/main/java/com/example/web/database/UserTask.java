package com.example.web.database;

import java.util.Date;

public class UserTask {
    int id;
    String title;
    String description;
    Date due_date;
    int user_id;
    String status;

    public UserTask(String title, String description, Date due_date, int user_id, String status){
        this.title = title;
        this.description = description;
        this.due_date = due_date;
        this.user_id = user_id;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getDue_date() {
        return due_date;
    }

    public void setDue_date(Date due_date) {
        this.due_date = due_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
