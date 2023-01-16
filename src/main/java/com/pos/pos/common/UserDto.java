package com.pos.pos.common;

public class UserDto {
    Long id;
    String username;
    String email;
    String password;
    String usertype;

    public UserDto(Long id, String username, String email, String password, String usertype) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.usertype = usertype;
    }

    public UserDto(String username, String email, String password, String usertype) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.usertype = usertype;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
}
