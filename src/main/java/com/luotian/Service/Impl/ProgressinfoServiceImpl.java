/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/23  19:45
 * Content:
 **/

package com.luotian.Service.Impl;

import com.luotian.Entity.Activitytouser;
import com.luotian.Entity.Progressinfo;
import com.luotian.Mapper.ActivitytouserMapper;
import com.luotian.Mapper.ProgressinfoMapper;
import com.luotian.Service.ProgressinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ProgressinfoServiceImpl implements ProgressinfoService {
    @Autowired
    private ProgressinfoMapper progressinfoMapper;
    @Autowired
    private ActivitytouserMapper activitytouserMapper;
    @Override
    public int addProgressinfo(Progressinfo progressinfo) {
        String result="";
        String character="ABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";
        int characterLength=character.length();
        for(int i=0;i<5;i++)
        {
            result=result+character.charAt((int)Math.floor(Math.random() * characterLength));
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        result=result+df.format(new Date());
        progressinfo.setProid(result);
        return progressinfoMapper.addProgressinfo(progressinfo);
    }

    @Override
    public int deleteProgressinfo(String id, String activityid) {
        return progressinfoMapper.deleteProgressinfo(id,activityid);
    }

    @Override
    public int updateProgressinfo(Progressinfo progressinfo) {
        if(progressinfoMapper.findOneProgressinfo(progressinfo.getId(),progressinfo.getActivityid())==null)
        {
            return this.addProgressinfo(progressinfo);
        }
        return progressinfoMapper.updateProgressinfo(progressinfo);

    }

    @Override
    public List<Map<String, Object>> findpersonProgress(String id, String activityid, int isread) {
        if(id!=null && id!=""&&activityid!=""&&activityid!=null &&isread>=0&&isread<=1)
        {
            return progressinfoMapper.findpersonProgress(id,activityid,isread);
        }
        return null;
    }

    @Override
    public int updateModeProgress(Activitytouser activitytouser, Progressinfo progressinfo) {
        int code=progressinfoMapper.updateProgressinfo(progressinfo);
        code=code+activitytouserMapper.updateActivitytoUser(activitytouser);
        return code;
    }

    @Override
    public int deleteProgressinfoByTeacher(String activityid) {
        if(activityid!=null && activityid!="")
        {
            return progressinfoMapper.deleteProgressinfoByTeacher(activityid);
        }
        return 0;
    }

    @Override
    public int deleteStudentProgress(String id) {
        return progressinfoMapper.deleteStudentProgress(id);
    }

    @Override
    public int updateTeacherByManage(String staffid, String teacherid) {
        return progressinfoMapper.updateTeacherByManage(staffid,teacherid);
    }
}
