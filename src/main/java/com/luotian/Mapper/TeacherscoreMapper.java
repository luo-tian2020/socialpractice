/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  18:16
 * Content:
 **/

package com.luotian.Mapper;

import com.luotian.Entity.Teacherscore;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface TeacherscoreMapper {
    //查询所有老师评分
    public List<Teacherscore> findAllTeacherscore();
    //查询某一老师评分情况
    public List<Teacherscore> findteacherTeacherscore(String staffid);
    //查询某一学生得到评分
    public List<Teacherscore> findstudentTeacherscore(String studentid);
    //查询某一社会实践老师评分
    public List<Teacherscore> findactivityTeacherscore(String activityid);
    //查询某一特定活动
    public Teacherscore findOneTeacherscore(String activityid,String studentid);
    //添加社会实践评分
    public int addTeacherscore(Teacherscore teacherscore);
    //删除社会实践
    public int deleteTeacherscore(String activityid,String studentid);
    //更新社会实践
    public int updateTeacherscore(Teacherscore teacherscore);
    //老师对学生评分返回的信息
    public List<Map<String,Object>> findWillGetScore(@Param("id") String id,@Param("activityid")String activvityid);
    //删除活动相关评分信息由老师发起
    public int deleteTeacherscoreByTeacher(String activityid);
    //删除学生老师评分信息。
    public  int deleteStudentTeacherscore(String id);
}
