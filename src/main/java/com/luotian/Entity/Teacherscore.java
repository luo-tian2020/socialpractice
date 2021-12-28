/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/7  22:41
 * Content:
 **/

package com.luotian.Entity;

public class Teacherscore {
    private String activityid;
    private String studentid;
    private String staffid;
    private double score;

    @Override
    public String toString() {
        return "Teacherscore{" +
                "activityid='" + activityid + '\'' +
                ", studentid='" + studentid + '\'' +
                ", staffid='" + staffid + '\'' +
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

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }
}
