package com.luotian.Entity;

public class Activitytouser {
    private String activityid;
    private String studentid;//这里指的不是工号！！！
    private String mode;

    @Override
    public String toString() {
        return "Activitytouser{" +
                "activityid='" + activityid + '\'' +
                ", studentid='" + studentid + '\'' +
                ", mode='" + mode + '\'' +
                '}';
    }

    public String getActivityid() {
        return activityid;
    }

    public void setActivityid(String activityid) {
        this.activityid = activityid;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }
}
