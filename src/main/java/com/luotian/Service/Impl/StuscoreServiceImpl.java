/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  21:30
 * Content:
 **/

package com.luotian.Service.Impl;

import com.luotian.Entity.Stuscore;
import com.luotian.Mapper.StuscoreMapper;
import com.luotian.Service.StuscoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StuscoreServiceImpl implements StuscoreService {
    @Autowired
    private StuscoreMapper stuscoreMapper;
    @Override
    public Stuscore findOneStuscore(String activityid, String studentid) {
        if(activityid!=null && studentid!=null)
        {
            return stuscoreMapper.findOneStuscore(activityid,studentid);
        }
        return null;
    }

    @Override
    public List<Stuscore> findUserStuscore(String studentid) {
        if(studentid!=null)
        {
            return stuscoreMapper.findUserStuscore(studentid);
        }
        return null;
    }

    @Override
    public List<Stuscore> findActivityStuscore(String activityid) {
        if(activityid!=null)
        {
            return stuscoreMapper.findActivityStuscore(activityid);
        }
        return null;
    }

    @Override
    public List<Stuscore> findAllscore() {
        return stuscoreMapper.findAllscore();
    }

    @Override
    public int updateStuscoreInfo(Stuscore stuscore) {
      if(stuscoreMapper.findOneStuscore(stuscore.getActivityid(),stuscore.getStudentid())==null)
      {
          return stuscoreMapper.addStuscore(stuscore);
      }
      return stuscoreMapper.updateStuscore(stuscore);
    }

    @Override
    public int deleteStuscoreInfo(String activityid, String studentid) {
        if(activityid!=null && studentid!=null)
        {
            if(stuscoreMapper.findOneStuscore(activityid,studentid)!=null)
            {
                return stuscoreMapper.deleteStuscore(activityid,studentid);
            }
            return 1;
        }
        return -1;
    }

    @Override
    public List<Map<String, Object>> findScoreStudent(String id) {
        if(id!=null &&id!="")
        {
            return stuscoreMapper.findScoreStudent(id);
        }
        return null;
    }

    @Override
    public int deleteStuscoreByTeacher(String activityid) {
        if(activityid!=null&&activityid!="")
        {
            return stuscoreMapper.deleteStuscoreByTeacher(activityid);
        }
        return 0;
    }

    @Override
    public int deleteStudentScore(String id) {
        return stuscoreMapper.deleteStudentScore(id);
    }
}
