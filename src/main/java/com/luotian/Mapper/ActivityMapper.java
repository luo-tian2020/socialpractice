/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  18:14
 * Content:
 **/

package com.luotian.Mapper;

import com.luotian.Entity.Activity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ActivityMapper {
    //添加社会实践活动
    public int addActivity(Activity activity);
    //删除社会实践活动
    public int deleteActivity(String activityid);
    //更新社会实践活动
    public int updateActivity(Activity activity);
    //根据activityid查询社会实践活动
    public Activity findOneActivity(String activityid);
    //根据staffid查询社会实践活动
    public List<Activity> findUserActivity(String staffid);
    //查询所有社会实践活动
    public List<Activity> findAllActivity();
    //查询学生未参加的活动
    public List<Map<String,Object>> findNotAttendedActicity(String id);
    //查询学生已参加的活动
    public List<Map<String,Object>> findAttendedActivity(String id);
    //查询满活动、不满活动；
    public  List<Activity> findActivityIsFull(int isfull);
    //查询参与活动的活动人数
    public List<Map<String,Object>> findActivitytoUser();
    //查询活动的参与人数
    public  List<Map<String,Object>> findActivityusers();
    //查询某一社会实践的人物详情
    public List<Map<String,Object>> findActivityPersonsdetail(String activityid);
    //leaveperson+1
    public int updateaddleaveperson(String activityid);
    //修改教师
    public int updateStaffidBymanage(@Param("staffid") String staffid,@Param("teacherid")String teacherid);
}
