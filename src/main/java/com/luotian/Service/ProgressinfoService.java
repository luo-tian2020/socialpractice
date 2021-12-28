/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/23  19:43
 * Content:
 **/

package com.luotian.Service;

import com.luotian.Entity.Activitytouser;
import com.luotian.Entity.Progressinfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProgressinfoService {
    //添加日常情况信息
    public int addProgressinfo(Progressinfo progressinfo);
    //删除日常情况
    public int deleteProgressinfo( String id,  String activityid);
    //修改日常情况
    public int updateProgressinfo(Progressinfo progressinfo);
    //查询某人的是否已读进程
    public List<Map<String,Object>> findpersonProgress( String id, String activityid, int isread);
    //修改进度与日常情况
    public int updateModeProgress(Activitytouser activitytouser,Progressinfo progressinfo);
    //删除信息由老师发起
    public  int deleteProgressinfoByTeacher(String activityid);
    public int deleteStudentProgress(String id);
    //修改老师
    public  int updateTeacherByManage(String staffid, String teacherid);
}
