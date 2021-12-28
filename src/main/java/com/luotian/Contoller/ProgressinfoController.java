/**
 * Author:   luotian
 * Connection:  2731741733@qq.com
 * Time: 2021/12/23  19:53
 * Content:
 **/

package com.luotian.Contoller;

import com.luotian.Entity.Activitytouser;
import com.luotian.Entity.Progressinfo;
import com.luotian.Service.ActivityService;
import com.luotian.Service.ActivitytouserService;
import com.luotian.Service.ProgressinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProgressinfoController {
    @Autowired
    private ProgressinfoService progressinfoService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private ActivitytouserService activitytouserService;
@RequestMapping("/addprogressinfo")
    public ModelAndView addProgressinfobyuser(Progressinfo progressinfo)
    {
        System.out.println(progressinfo);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("studentProgress");
       int code=progressinfoService.addProgressinfo(progressinfo);
       modelAndView.addObject("flag",code);
        modelAndView.addObject("hasactivity",activityService.findAttendedActivity(progressinfo.getId()));
        modelAndView.setViewName("studentProgress");
        modelAndView.addObject("progressActivity",activitytouserService.findProgressActivity(progressinfo.getId()));
        return modelAndView;
    }
    //获取老师已发布的社会实践
    @RequestMapping("/getprogressactivity")
    public ModelAndView getActivitybyteacher(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("teacherprogress");
        modelAndView.addObject("teachersactivity",activityService.findActivityToTeacher(id));
        modelAndView.addObject("progress",0);
        return modelAndView;
    }
//查看某活动的具体参与学生情况
    @RequestMapping("/getactivityPersonsDetail")
    public ModelAndView getActivityPersonsByTeacher(String activityid)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("teacherprogress");
        modelAndView.addObject("progress",1);
        modelAndView.addObject("activitytitle",activityService.findOneActivity(activityid).getActivitytitle());
        modelAndView.addObject("activitypersonsdetail",activityService.findActivityPersonsdetail(activityid));
        return modelAndView;
    }
    //查看某一人的总体进度
    @RequestMapping("/getpersonprogress")
    public ModelAndView findPersonProgress(String id,String activityid)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("teacherprogress");
        modelAndView.addObject("progress",2);
        modelAndView.addObject("activityid",activityid);
        modelAndView.addObject("activitytitle",activityService.findOneActivity(activityid).getActivitytitle());
        modelAndView.addObject("passprogress",progressinfoService.findpersonProgress(id,activityid,1));
        modelAndView.addObject("notpassprogress",progressinfoService.findpersonProgress(id,activityid,0));
        return modelAndView;
    }
    //修改进度以及学生日常情况是否已读
    @RequestMapping("/updatemodeProgress")
    public ModelAndView modifyModeProgress(String mode,String activityid,String studentid,String proid)
    {
        System.out.println(studentid);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("teacherprogress");
        modelAndView.addObject("progress",2);
        Activitytouser activitytouser=new Activitytouser();
        activitytouser.setActivityid(activityid);
        activitytouser.setStudentid(studentid);
        activitytouser.setMode(mode);
        Progressinfo progressinfo=new Progressinfo();
        progressinfo.setProid(proid);
        progressinfo.setIsread(1);
        modelAndView.addObject("flag",progressinfoService.updateModeProgress(activitytouser,progressinfo));
        modelAndView.addObject("activityid",activityid);
        modelAndView.addObject("activitytitle",activityService.findOneActivity(activityid).getActivitytitle());
        modelAndView.addObject("passprogress",progressinfoService.findpersonProgress(studentid,activityid,1));
        modelAndView.addObject("notpassprogress",progressinfoService.findpersonProgress(studentid,activityid,0));
        return modelAndView;
    }

}
