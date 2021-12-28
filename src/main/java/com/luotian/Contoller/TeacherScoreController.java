/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/20  12:00
 * Content:
 **/

package com.luotian.Contoller;

import com.luotian.Entity.Activity;
import com.luotian.Entity.Stuscore;
import com.luotian.Entity.Teacherscore;
import com.luotian.Service.ActivityService;
import com.luotian.Service.StuscoreService;
import com.luotian.Service.TeacherscoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class TeacherScoreController {
    @Autowired
    public TeacherscoreService teacherscoreService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private StuscoreService stuscoreService;
    //老师评分要获取的信息
    @RequestMapping("/findteacherscore")
    public ModelAndView getWillScore(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("manageactivity");
        List<Activity> teacheractivity=activityService.findActivityToTeacher(id);
        modelAndView.addObject("teacheractivity",teacheractivity);
       modelAndView.addObject("flag",0);
        return modelAndView;
    }
    @RequestMapping("/willteacherscore")
    public ModelAndView prepareUpdateScore(String activityid,String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("manageactivity");
        modelAndView.addObject("flag",1);
        modelAndView.addObject("teacherscore",teacherscoreService.findWillGetScore(id,activityid));
        return modelAndView;
    }
    @RequestMapping("/updateScore")
    public  ModelAndView updateScore(Teacherscore teacherscore)
    {
        System.out.println(teacherscore.toString());
        ModelAndView modelAndView=new ModelAndView();
        Stuscore stuscore=new Stuscore();
        stuscore.setScore(teacherscore.getScore());
        stuscore.setActivityid(teacherscore.getActivityid());
        stuscore.setStudentid(teacherscore.getStudentid());
        // 目前只针对单个老师
        int code=stuscoreService.updateStuscoreInfo(stuscore);
        int code1=teacherscoreService.updateTeacherscore(teacherscore);
        modelAndView.setViewName("manageactivity");
        modelAndView.addObject("flag",1);
        modelAndView.addObject("flagscore",code1);
        modelAndView.addObject("teacherscore",teacherscoreService.findWillGetScore(teacherscore.getStaffid(),teacherscore.getActivityid()));
        return modelAndView;
    }
}
