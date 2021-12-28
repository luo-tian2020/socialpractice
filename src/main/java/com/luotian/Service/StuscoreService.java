/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/8  21:27
 * Content:
 **/

package com.luotian.Service;

import com.luotian.Entity.Stuscore;

import java.util.List;
import java.util.Map;

public interface StuscoreService {
    //查询学生某一社会实践的分数
    public Stuscore findOneStuscore(String activityid, String studentid);
    //查询学生所有分数
    public List<Stuscore> findUserStuscore(String studentid);
    //查询某一社会实践学生的分数
    public List<Stuscore> findActivityStuscore(String activityid);
    //查询所有社会实践所有信息
    public List<Stuscore> findAllscore();
    //添加或更新信息
    public int updateStuscoreInfo(Stuscore stuscore);
    //删除信息
    public int deleteStuscoreInfo(String activityid,String studentid);
    //查询学生活动得分信息
    public List<Map<String,Object>> findScoreStudent( String id);
    //删除活动相关信息，由老师发起
    public int deleteStuscoreByTeacher(String activityid);
    public int deleteStudentScore(String id);

}
