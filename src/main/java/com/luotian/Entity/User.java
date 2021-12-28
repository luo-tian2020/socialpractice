package com.luotian.Entity;

public class User {
    private String id;
    private String staffid;
    private String username;
    private String password;
    private String college;
    private int authority;
    private String staff;
    private String phone;

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", staffid='" + staffid + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", college='" + college + '\'' +
                ", authority=" + authority +
                ", staff='" + staff + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
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

    public int getAuthority() {
        return authority;
    }

    public void setAuthority(int authority) {
        this.authority = authority;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
