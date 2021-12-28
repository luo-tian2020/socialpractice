/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  22:56
 * Content:
 **/

package com.luotian.Service.Impl;

import com.luotian.Entity.Teacherscore;
import com.luotian.Mapper.TeacherscoreMapper;
import com.luotian.Service.TeacherscoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TeacherscoreServiceImpl implements TeacherscoreService {
    @Autowired
    private TeacherscoreMapper teacherscoreMapper;
    @Override
    public List<Teacherscore> findAllTeacherscore() {
        return teacherscoreMapper.findAllTeacherscore();
    }

    @Override
    public List<Teacherscore> findteacherTeacherscore(String staffid) {
       if(staffid!=null)
       {
           return teacherscoreMapper.findteacherTeacherscore(staffid);
       }
       return null;
    }

    @Override
    public List<Teacherscore> findstudentTeacherscore(String studentid) {
       if(studentid!=null)
       {
           return teacherscoreMapper.findstudentTeacherscore(studentid);
       }
       return null;
    }

    @Override
    public List<Teacherscore> findactivityTeacherscore(String activityid) {
        if(activityid!=null)
        {
            return teacherscoreMapper.findactivityTeacherscore(activityid);
        }
        return null;
    }

    @Override
    public Teacherscore findOneTeacherscore(String activityid, String studentid) {
        if(activityid!=null &&studentid!=null)
        {
            return teacherscoreMapper.findOneTeacherscore(activityid,studentid);
        }
        return null;
    }

    @Override
    public int updateTeacherscore(Teacherscore teacherscore) {
        if(teacherscoreMapper.findOneTeacherscore(teacherscore.getActivityid(),teacherscore.getStudentid())==null)
        {
            return teacherscoreMapper.addTeacherscore(teacherscore);
        }
        return teacherscoreMapper.updateTeacherscore(teacherscore);
    }

    @Override
    public int deleteTeacherscore(String activityid, String studentid) {
        if(activityid!=null &&studentid!=null)
        {
            if(teacherscoreMapper.findOneTeacherscore(activityid,studentid)!=null)
            {
                return teacherscoreMapper.deleteTeacherscore(activityid,studentid);
            }
            return 1;
        }
        return -1;
    }

    @Override
    public List<Map<String, Object>> findWillGetScore(String id,String activityid) {
        if(id!=""&&id!=null)
        {
            return teacherscoreMapper.findWillGetScore(id,activityid);
        }
        return null;
    }

    @Override
    public int deleteTeacherscoreByTeacher(String activityid) {
        if(activityid!=null&&activityid!="")
        {
            return teacherscoreMapper.deleteTeacherscoreByTeacher(activityid);
        }
        return 0;
    }

    @Override
    public int deleteStudentTeacherscore(String id) {
        return teacherscoreMapper.deleteStudentTeacherscore(id);
    }
}
