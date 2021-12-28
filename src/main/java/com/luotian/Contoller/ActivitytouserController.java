/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/17  16:56
 * Content:
 **/

package com.luotian.Contoller;

import com.luotian.Entity.*;
import com.luotian.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class ActivitytouserController {
    @Autowired
    private ActivitytouserService activitytouserService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private StuscoreService stuscoreService;
    @Autowired
    private TeacherscoreService teacherscoreService;
    @Autowired
    private ProgressinfoService progressinfoService;

    //学生参选，添加参选信息。
    @RequestMapping("/addactivitytouser")
    public ModelAndView addActivitytoUser(Activitytouser activitytouser)
    {

        ModelAndView modelAndView=new ModelAndView();
        activitytouser.setMode("0");
        //更新活动信息
        Activity activity=activityService.findOneActivity(activitytouser.getActivityid());
        int flag=0;
        if(activity.getIsfull()==1)
        {
            //活动人数已满，参选失败
            flag=0;
        }
        else{
            String teacherid=activity.getStaffid();
            activity.setLeaveperson(activity.getLeaveperson()-1);
            if(activity.getLeaveperson()==0)
            {
                activity.setIsfull(1);
            }
            activityService.updateActvity(activity);
            //添加activitytouser信息
           flag=activitytouserService.updateActivitytoUser(activitytouser);
            //添加progressinfo信息
            Progressinfo progressinfo=new Progressinfo();
            progressinfo.setIsread(1);
            progressinfo.setActivityid(activitytouser.getActivityid());
            progressinfo.setProinfo("参选");
            progressinfo.setTeacherid(teacherid);
            progressinfo.setId(activitytouser.getStudentid());
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            progressinfo.setProtime(""+df.format(new Date()));
            progressinfoService.addProgressinfo(progressinfo);
            //添加老师评分信息
            Teacherscore teacherscore=new Teacherscore();
            teacherscore.setActivityid(activitytouser.getActivityid());
            teacherscore.setScore(-1);
            teacherscore.setStudentid(activitytouser.getStudentid());
            teacherscore.setStaffid(teacherid);
            teacherscoreService.updateTeacherscore(teacherscore);
            //添加学生分数信息
            Stuscore stuscore=new Stuscore();
            stuscore.setStudentid(activitytouser.getStudentid());
            stuscore.setActivityid(activitytouser.getActivityid());
            stuscore.setScore(-1);
            stuscoreService.updateStuscoreInfo(stuscore);
        }
        modelAndView.addObject("notAttend",activityService.findNotAttendedActicity(activitytouser.getStudentid()));
        modelAndView.addObject("attend",activityService.findAttendedActivity(activitytouser.getStudentid()));
        modelAndView.addObject("flag",flag);
        modelAndView.setViewName("choosesocial");
        return modelAndView;
    }
    //学生退选，删除相关信息
    @RequestMapping("/deleteActivitytouser")
    public ModelAndView deleteActivitytoUser(String id,String activityid)
    {
        ModelAndView modelAndView=new ModelAndView();
        //删除学生活动表的信息内容
        int flag=activitytouserService.deleteActivitytouser(activityid,id)+2;
        //更新活动信息内容
        Activity activity=activityService.findOneActivity(activityid);
        activity.setLeaveperson(activity.getLeaveperson()+1);
        if(activity.getIsfull()==1)
        {
            activity.setIsfull(0);
        }
        activityService.updateActvity(activity);
        //删除progressinfo信息
        progressinfoService.deleteProgressinfo(id,activityid);
        //删除老师评分信息
        teacherscoreService.deleteTeacherscore(activityid,id);
        //删除学生评分信息
        stuscoreService.deleteStuscoreInfo(activityid,id);
        modelAndView.addObject("notAttend",activityService.findNotAttendedActicity(id));
        modelAndView.addObject("attend",activityService.findAttendedActivity(id));
        modelAndView.addObject("flag",flag);
        modelAndView.setViewName("choosesocial");
        return modelAndView;
    }
    //学生社会实践进度信息
    @RequestMapping("/searchProgress")
    public ModelAndView findActivityProgress(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        List<Map<String,Object>> progressActivity= activitytouserService.findProgressActivity(id);
        modelAndView.addObject("hasactivity",activityService.findAttendedActivity(id));
        modelAndView.setViewName("studentProgress");
        modelAndView.addObject("progressActivity",progressActivity);
        return modelAndView;
    }
}
