package com.example.proyectodblenguajes.Models.DTO;


public class User {
    private int id;
    private String username;
    private String email;
    private String role;


    public User(String username, String email, String role, int id) {
        this.username = username;
        this.email = email;
        this.role = role;
        this.id = id;
    }


    public User() {
    }


    public String getUsername() {
        return username;
    }


    public void setUsername(String username) {
        this.username = username;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public String getRole() {
        return role;
    }


    public void setRole(String role) {
        this.role = role;
    }


    public int getId() {
        return id;
    }


    public void setId(int id) {
        this.id = id;
    }


}



