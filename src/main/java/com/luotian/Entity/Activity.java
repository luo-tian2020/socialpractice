package com.luotian.Entity;

public class Activity {
    private String activityid;
    private String staffid;
    private String activitydetail;
    private String activitytitle;
    private String starttime;
    private String endtime;
    private int persons;
    private int isfull;//值只能为0或1
    private int leaveperson;
    public int getLeaveperson() {
        return leaveperson;
    }


    public void setLeaveperson(int leaveperson) {
        this.leaveperson = leaveperson;
    }


    @Override
    public String toString() {
        return "Activity{" +
                "activityid='" + activityid + '\'' +
                ", staffid='" + staffid + '\'' +
                ", activitydetail='" + activitydetail + '\'' +
                ", activitytitle='" + activitytitle + '\'' +
                ", starttime='" + starttime + '\'' +
                ", endtime='" + endtime + '\'' +
                ", persons=" + persons +
                ", isfull=" + isfull +
                ", leaveperson=" + leaveperson +
                '}';
    }

    public String getStarttime() {
        return starttime;
    }

    public void setStarttime(String starttime) {
        this.starttime = starttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getActivityid() {
        return activityid;
    }

    public void setActivityid(String activityid) {
        this.activityid = activityid;
    }

    public String getStaffid() {
        return staffid;
    }

    public void setStaffid(String staffid) {
        this.staffid = staffid;
    }

    public String getActivitydetail() {
        return activitydetail;
    }

    public void setActivitydetail(String activitydetail) {
        this.activitydetail = activitydetail;
    }

    public String getActivitytitle() {
        return activitytitle;
    }

    public void setActivitytitle(String activitytitle) {
        this.activitytitle = activitytitle;
    }

    public int getPersons() {
        return persons;
    }

    public void setPersons(int persons) {
        this.persons = persons;
    }

    public int getIsfull() {
        return isfull;
    }

    public void setIsfull(int isfull) {
        this.isfull = isfull;
    }
}
