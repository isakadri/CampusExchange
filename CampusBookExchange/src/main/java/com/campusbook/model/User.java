package com.campusbook.model;

public class User {

    private int userId;
    private String name;
    private String email;
    private String password;
    private String college;
    private String department;
    private int semester;
    private String phone;
    private String role;

    public User() {
    }

    public User(String name, String email, String password,
                String college, String department,
                int semester, String phone) {

        this.name = name;
        this.email = email;
        this.password = password;
        this.college = college;
        this.department = department;
        this.semester = semester;
        this.phone = phone;
        this.role = "STUDENT";
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}