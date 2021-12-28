/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  20:46
 * Content:
 **/

package com.luotian.Service.Impl;

import com.luotian.Entity.Activitytouser;
import com.luotian.Mapper.ActivitytouserMapper;
import com.luotian.Service.ActivitytouserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class ActivitytouserServiceImpl implements ActivitytouserService {
    @Autowired
    private ActivitytouserMapper activitytouserMapper;

    @Override
    public List<Activitytouser> findAllActivitytoUser() {
        return activitytouserMapper.findAllActivitytoUser();
    }

    @Override
    public List<Activitytouser> findPartActivitytoUser(String studentid) {
       if(studentid!=null)
       {
           return activitytouserMapper.findPartActivitytoUser(studentid);
       }
       return null;
    }

    @Override
    public Activitytouser findOneActivitytoUser(String activityid, String studentid) {
        if(activityid!=null && studentid!=null)
        {
            return activitytouserMapper.findOneActivitytoUser(activityid,studentid);
        }
        return null;
    }

    @Override
    public List<Activitytouser> findActivitytoUserPart(String activityid) {
        if(activityid!=null)
        {
            return activitytouserMapper.findActivitytoUserPart(activityid);
        }
        return null;
    }

    @Override
    public int updateActivitytoUser(Activitytouser activitytouser) {
        if(activitytouserMapper.findOneActivitytoUser(activitytouser.getActivityid(),activitytouser.getStudentid())==null)
        {
            return activitytouserMapper.addActivitytoUser(activitytouser);
        }
        return activitytouserMapper.updateActivitytoUser(activitytouser);
    }

    @Override
    public int deleteActivitytouser(String activityid, String studentid) {
        if(activityid!=null && studentid!=null)
        {
            if(activitytouserMapper.findOneActivitytoUser(activityid,studentid)!=null)
            {
                return activitytouserMapper.deleteActivitytoUser(activityid,studentid);
            }
            return 1;
        }
        return -1;
    }

    @Override
    public List<Map<String, Object>> findProgressActivity(String id) {
        if(id!=null && id!="")
        {
            return activitytouserMapper.findProgressActivity(id);
        }
        return null;
    }

    @Override
    public int deleteActivitytouserByTeacher(String activityid) {
        if(activityid!=null &&activityid!="")
        {
            return activitytouserMapper.deleteActivitytouserByTeacher(activityid);
        }
        return 0;
    }

    @Override
    public int deleteStudent(String id) {
        return activitytouserMapper.deleteStudent(id);
    }
}
