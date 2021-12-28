/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/16  15:45
 * Content:
 **/

package com.luotian.Contoller;

import com.alibaba.fastjson.JSON;
import com.luotian.Entity.Activity;
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
public class ActivityController {
    @Autowired
    private ActivityService activityService;
    @Autowired
    private UserService userService;
    @Autowired
    private ActivitytouserService activitytouserService;
    @Autowired
    private ProgressinfoService progressinfoService;
    @Autowired
    private StuscoreService stuscoreService;
    @Autowired
    private TeacherscoreService teacherscoreService;
    //未参加的活动实践
    @RequestMapping("/choosesocial")
    public ModelAndView NotAttendedActivity(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        List<Map<String,Object>> Notattend=activityService.findNotAttendedActicity(id);
        List<Map<String,Object>> attendActivity=activityService.findAttendedActivity(id);
        if(Notattend==null)
        {
            modelAndView.setViewName("choosesocial");
        }
        else{
            modelAndView.setViewName("choosesocial");
            modelAndView.addObject("notAttend",Notattend);
            modelAndView.addObject("attend",attendActivity);
        }
        return modelAndView;
    }
    //获取老师已发布的社会实践
    @RequestMapping("/getteacheractivity")
    public ModelAndView findSubmitActivity(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        List<Activity> teacherActivity=activityService.findActivityToTeacher(id);
        modelAndView.setViewName("editactivity");
        modelAndView.addObject("teacheractivity",teacherActivity);
        return modelAndView;
    }
    @RequestMapping("/updateactivity")
    public ModelAndView updateActivity(Activity activity)
    {
        System.out.println(activity.getPersons());
        ModelAndView  modelAndView=new ModelAndView();
        int code=0;
        Activity activity1=activityService.findOneActivity(activity.getActivityid());
        if(activity.getPersons()!=activity1.getPersons())
        {
        if((activity1.getPersons()-activity1.getLeaveperson())>activity.getPersons())
        {
           code=6;
        }
        else{
            activity.setLeaveperson(activity.getPersons()-activity1.getPersons()+ activity1.getLeaveperson());
            if(activity.getLeaveperson()==0)
            {
                activity.setIsfull(1);
            }
            code=activityService.updateActvity(activity);
        }
        }
        else{
            code=activityService.updateActvity(activity);
        }
        modelAndView.addObject("teacheractivity",activityService.findActivityToTeacher(activity.getStaffid()));
       modelAndView.addObject("flag",code);
        modelAndView.setViewName("editactivity");
        return modelAndView;
    }
    @RequestMapping("/deleteactivity")
    public ModelAndView deleteActivity(String activityid,String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        int code=activityService.deleteActivity(activityid);
        activitytouserService.deleteActivitytouserByTeacher(activityid);
        progressinfoService.deleteProgressinfoByTeacher(activityid);
        stuscoreService.deleteStuscoreByTeacher(activityid);
        teacherscoreService.deleteTeacherscoreByTeacher(activityid);
        code=code+2;
        modelAndView.setViewName("editactivity");
        modelAndView.addObject("teacheractivity",activityService.findActivityToTeacher(id));
        modelAndView.addObject("flag",code);
        return modelAndView;
    }
    @RequestMapping("/addactivity")
    public ModelAndView addActivity(Activity activity)
    {
        ModelAndView modelAndView=new ModelAndView();
        //设置活动id
        String result="";
        String character="ABCDEFGHIGKLMNOPQRSTUVWXYZ0123456789";
        int characterLength=character.length();
        for(int i=0;i<3;i++)
        {
            result=result+character.charAt((int)Math.floor(Math.random() * characterLength));
        }
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
        result=result+df.format(new Date());
        activity.setActivityid(result);
        activity.setIsfull(0);
        activity.setLeaveperson(activity.getPersons());
        int code=activityService.updateActvity(activity);
        code=code+4;
        modelAndView.addObject("flag",code);
        modelAndView.setViewName("editactivity");
        modelAndView.addObject("teacheractivity",activityService.findActivityToTeacher(activity.getStaffid()));
        return modelAndView;
    }
    //管理员管理社会实践页面
    @RequestMapping("/manageactivity")
    public ModelAndView manageActivity(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("managetoactivity");
        if(userService.findOneUser(id).getAuthority()==3)
        {
            List<Activity> fullactivity=activityService.findActivityIsFull(1);
            List<Activity> notfullactivity=activityService.findActivityIsFull(0);
            List<Map<String,Object>> activityuser=activityService.findActivitytoUser();
            String s1= JSON.toJSONString(activityService.findActivityusers());
            modelAndView.addObject("fullactivity",fullactivity);
            modelAndView.addObject("notfullactivity",notfullactivity);
            modelAndView.addObject("activityuser",activityuser);
            modelAndView.addObject("activityinusers",s1);
        }
        return modelAndView;
    }
    @RequestMapping("/deleteactivityByManage")
    public ModelAndView deleteActivitybyManage(String activityid)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("managetoactivity");
        int code=activityService.deleteActivity(activityid);
        activitytouserService.deleteActivitytouserByTeacher(activityid);
        progressinfoService.deleteProgressinfoByTeacher(activityid);
        stuscoreService.deleteStuscoreByTeacher(activityid);
        teacherscoreService.deleteTeacherscoreByTeacher(activityid);
        modelAndView.addObject("flag",code+2);
        modelAndView.addObject("fullactivity",activityService.findActivityIsFull(1));
        modelAndView.addObject("notfullactivity",activityService.findActivityIsFull(0));
        modelAndView.addObject("activityuser",activityService.findActivitytoUser());
        modelAndView.addObject("activityinusers",JSON.toJSONString(activityService.findActivityusers()));
        return modelAndView;
    }
    //管理员更新活动页面
    @RequestMapping("/updateactivitybymanage")
    public ModelAndView updateActivityByManage(Activity activity)
    {
        System.out.println(activity.getPersons());
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("managetoactivity");
        Activity activity1=activityService.findOneActivity(activity.getActivityid());
        int code=0;
        if(activity1==null)
        {
            code=4;
        }
        else
        {
            if(activity.getPersons()!=0)
            {
                if((activity1.getPersons()-activity1.getLeaveperson())>activity.getPersons())
                {
                    code=0;
                }
                else{
                    activity.setLeaveperson(activity.getPersons()-activity1.getPersons()+ activity1.getLeaveperson());
                    if(activity.getLeaveperson()==0)
                    {
                        activity.setIsfull(1);
                    }
                    code=activityService.updateActvity(activity);
                }
            }
            else
            {
                code=activityService.updateActvity(activity);
            }

        }
        modelAndView.addObject("flag",code);
        modelAndView.addObject("fullactivity",activityService.findActivityIsFull(1));
        modelAndView.addObject("notfullactivity",activityService.findActivityIsFull(0));
        modelAndView.addObject("activityuser",activityService.findActivitytoUser());
        modelAndView.addObject("activityinusers",JSON.toJSONString(activityService.findActivityusers()));
        return modelAndView;
    }


}
