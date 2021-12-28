/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/23  19:20
 * Content:
 **/

package com.luotian.Mapper;

import com.luotian.Entity.Progressinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProgressinfoMapper {
    //添加日常情况信息
    public int addProgressinfo(Progressinfo progressinfo);
    //删除日常情况
    public int deleteProgressinfo(@Param("id") String id, @Param("activityid") String activityid);
    //修改日常情况
    public int updateProgressinfo(Progressinfo progressinfo);
    //查询日常情况
    public Progressinfo findOneProgressinfo(@Param("id") String id,@Param("activityid") String activityid);
    //查询某人的是否已读进程
    public List<Map<String,Object>> findpersonProgress(@Param("id") String id,@Param("activityid")String activityid,@Param("isread")int isread);
    //删除信息由老师发起
    public  int deleteProgressinfoByTeacher(String activityid);
    //删除学生日常情况信息
    public int deleteStudentProgress(String id);
    //修改老师
    public  int updateTeacherByManage(@Param("staffid") String staffid,@Param("teacherid") String teacherid);

}
