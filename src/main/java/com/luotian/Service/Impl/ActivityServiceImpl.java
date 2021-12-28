/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  19:31
 * Content:
 **/

package com.luotian.Service.Impl;

import com.luotian.Entity.Activity;
import com.luotian.Mapper.ActivityMapper;
import com.luotian.Service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityMapper activityMapper;
    @Override
    public int updateActvity(Activity activity) {
        if(activityMapper.findOneActivity(activity.getActivityid())==null)
        {
            activityMapper.addActivity(activity);
        }
        return activityMapper.updateActivity(activity);
    }

    @Override
    public int deleteActivity(String activityid) {
       if (activityid!=null)
       {
           if (activityMapper.findOneActivity(activityid)!=null)
           {
               return activityMapper.deleteActivity(activityid);
           }
           return 1;
       }
       return -1;
    }

    @Override
    public Activity findOneActivity(String activityid) {
       if(activityid!=null)
       {
           return activityMapper.findOneActivity(activityid);
       }
       return null;
    }

    @Override
    public List<Activity> findActivityToTeacher(String staffid) {
        if(staffid!=null)
        {
            return activityMapper.findUserActivity(staffid);
        }
        return null;
    }

    @Override
    public List<Activity> findAllActivity() {
        return activityMapper.findAllActivity();
    }

//
    public List<Map<String,Object>> findNotAttendedActicity(String id) {
        if(id!=null&& id!="")
        {
            return activityMapper.findNotAttendedActicity(id);
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> findAttendedActivity(String id) {
        if(id!=null && id!="")
        {
            return activityMapper.findAttendedActivity(id);
        }
        return null;
    }

    @Override
    public List<Activity> findActivityIsFull(int isfull) {
        return activityMapper.findActivityIsFull(isfull);
    }

    @Override
    public List<Map<String, Object>> findActivitytoUser() {
        return activityMapper.findActivitytoUser();
    }

    @Override
    public List<Map<String, Object>> findActivityusers() {
        return activityMapper.findActivityusers();
    }

    @Override
    public List<Map<String, Object>> findActivityPersonsdetail(String activityid) {
        if(activityid!="" && activityid!=null)
        { return activityMapper.findActivityPersonsdetail(activityid);}
        return null;
    }

    @Override
    public int updateaddleaveperson(String activityid) {
        return activityMapper.updateaddleaveperson(activityid);
    }

    @Override
    public int updateStaffidBymanage(String staffid, String teacherid) {
        return activityMapper.updateStaffidBymanage(staffid,teacherid);
    }
}
