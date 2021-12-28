package com.luotian.Entity;

public class Stuscore {
    private String activityid;
    private String studentid;
    private double score;

    @Override
    public String toString() {
        return "Stuscore{" +
                "activityid='" + activityid + '\'' +
                ", studentid='" + studentid + '\'' +
                ", score=" + score +
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

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
