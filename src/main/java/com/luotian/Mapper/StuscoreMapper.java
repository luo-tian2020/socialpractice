/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  18:15
 * Content:
 **/

package com.luotian.Mapper;

import com.luotian.Entity.Stuscore;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface StuscoreMapper {
    //添加学生实践分数
    public int addStuscore(Stuscore stuscore);
    //删除学生实践分数
    public int deleteStuscore(String activityid,String studentid);
    //更新学生实践分数
    public int updateStuscore(Stuscore stuscore);
    //查询学生某一社会实践的分数
    public Stuscore findOneStuscore(String activityid,String studentid);
    //查询学生所有分数
    public List<Stuscore> findUserStuscore(String studentid);
    //查询某一社会实践学生的分数
    public List<Stuscore> findActivityStuscore(String activityid);
    //查询所有社会实践所有信息
    public List<Stuscore> findAllscore();
    //查询学生活动得分信息
    public List<Map<String,Object>> findScoreStudent(@Param("id") String id);
    //删除活动相关信息，由老师发起
    public int deleteStuscoreByTeacher(String activityid);
    //删除学生评分信息。
    public int deleteStudentScore(String id);
}
