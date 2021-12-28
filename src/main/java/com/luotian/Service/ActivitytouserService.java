/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  20:41
 * Content:
 **/

package com.luotian.Service;

import com.luotian.Entity.Activitytouser;

import java.util.List;
import java.util.Map;

public interface ActivitytouserService {
    //查询所有社会实践学生进度信息
    public List<Activitytouser> findAllActivitytoUser();
    //查询某一学生所有社会实践进度
    public List<Activitytouser> findPartActivitytoUser(String studentid);
    //查询某一学生特定社会实践进度信息
    public Activitytouser findOneActivitytoUser(String activityid,String studentid);
    //查询特定社会实践总体进度
    public List<Activitytouser> findActivitytoUserPart(String activityid);
    //添加或更新信息
    public int updateActivitytoUser(Activitytouser activitytouser);
    //删除社会实践信息
    public int deleteActivitytouser(String activityid,String studentid);
    //查询学生社会实践进度信息
    public List<Map<String,Object>> findProgressActivity(String id);
    //删除社会实践相关老师删除
    public int deleteActivitytouserByTeacher(String activityid);
    //删除学生的参与信息
    public int deleteStudent(String id);
}
