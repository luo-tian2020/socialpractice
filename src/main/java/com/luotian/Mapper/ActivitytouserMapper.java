/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  18:15
 * Content:
 **/

package com.luotian.Mapper;

import com.luotian.Entity.Activitytouser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface ActivitytouserMapper {
    //查询所有社会实践学生进度信息
    public List<Activitytouser> findAllActivitytoUser();
    //查询某一学生所有社会实践进度
    public List<Activitytouser> findPartActivitytoUser(String studentid);
    //查询某一学生特定社会实践进度信息
    public Activitytouser findOneActivitytoUser(String activityid,String studentid);
    //查询特定社会实践总体进度
    public List<Activitytouser> findActivitytoUserPart(String activityid);
    //添加学生社会实践状态信息
    public int addActivitytoUser(Activitytouser activitytouser);
    //删除学生社会实践状态信息
    public int deleteActivitytoUser(String activityid,String studentid);
    //更新社会实践学生进度信息
    public int updateActivitytoUser(Activitytouser activitytouser);
    //查询学生社会实践进度信息
    public List<Map<String,Object>> findProgressActivity(@Param("id") String id);
    //删除社会实践相关老师删除
    public int deleteActivitytouserByTeacher(String activityid);
    //删除学生的参与信息
    public int deleteStudent(String id);
}
