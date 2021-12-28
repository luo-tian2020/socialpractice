package com.luotian.Contoller;

import com.luotian.Entity.Activity;
import com.luotian.Entity.User;
import com.luotian.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private ActivitytouserService activitytouserService;
    @Autowired
    private StuscoreService stuscoreService;
    @Autowired
    private TeacherscoreService teacherscoreService;
    @Autowired
    private ProgressinfoService progressinfoService;
    @RequestMapping(value = "/finduser",method = RequestMethod.POST)
    public ModelAndView findOneUser(String id)
    {

        System.out.println(id);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("login");
        modelAndView.addObject("user",userService.findOneUser(id));
//        return userService.findOneUser(id);
        return modelAndView;
    }
@RequestMapping(value ="/login",method = RequestMethod.POST)
    public ModelAndView login(String phone, String password, HttpSession httpSession)
    {
        ModelAndView modelAndView=new ModelAndView();
        User user=userService.login(phone);
        if(user==null)
        {
            modelAndView.setViewName("login");
            modelAndView.addObject("flag",2);
            return modelAndView;
        }
       else
        {
            if(user.getPassword().equals(password))
            {
                httpSession.setAttribute("user",user);
                List<Activity> activityList= userService.findActivitiesAttended(user.getId());
                if(user.getAuthority()==1)
                {
                    modelAndView.setViewName("student");
                    modelAndView.addObject("Activitylist",activityList);
                }
                else if(user.getAuthority()==2)
                {
                    modelAndView.setViewName("teacher");
                    modelAndView.addObject("Activitylist",activityService.findActivityToTeacher(user.getId()));
                }
                else if(user.getAuthority()==3)
                {
                    modelAndView.setViewName("manager");
                }

            }
            else{
                modelAndView.setViewName("login");
                modelAndView.addObject("flag",0);
            }
            return modelAndView;
        }
    }
    @RequestMapping(value = "/adduser",method = RequestMethod.POST)
    public ModelAndView zhuce(User user)
    {

        int code=0;
        //检查手机号是否为空
        if(user.getPhone().equals(null))
        {
           code=4;
        }
        else
        {
            //检查手机号是否被注册
            if(userService.login(user.getPhone())==null)
            {
                String result="";
                String character="ABCDEFGHIGKLMNOPQRSTUVWXYZ";
                int characterLength=character.length();
                for(int i=0;i<5;i++)
                {
                    result=result+character.charAt((int)Math.floor(Math.random() * characterLength));
                }
                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                result=result+df.format(new Date());
                user.setId(result);
                int authority=user.getAuthority();
                if(authority==1)
                {
                    user.setStaff("学生");
                }
                else if(authority==2)
                {
                    user.setStaff("教师");
                }
                else if(authority==3)
                {
                    user.setStaff("管理员");
                }
                 code=userService.updateToUser(user);
            }
            else
            {
                code=3;
            }
        }
        ModelAndView modelAndView=new ModelAndView();
        if(code==0)//手机未注册并且添加用户失败
        {
            modelAndView.setViewName("registration");
            modelAndView.addObject("flag",0);
        }
        else if(code==1) {//手机未注册且添加用户成功
            modelAndView.setViewName("login");
            modelAndView.addObject("flag",1);
        }
        else if(code==3)//手机号被注册
        {
            modelAndView.setViewName("registration");
            modelAndView.addObject("flag",2);
        }
        else if(code==4){//手机号为空
            modelAndView.setViewName("registration");
            modelAndView.addObject("flag",3);
        }
        return modelAndView;
    }
    //更新个人信息
    @RequestMapping("/updateuser")
    public ModelAndView updateUser(User user,HttpSession httpSession) {
        if (user.getAuthority() == 1) {
            user.setStaff("学生");
        } else if (user.getAuthority() == 2) {
            user.setStaff("教师");
        } else if (user.getAuthority() == 3) {
            user.setStaff("管理员");
        }
        ModelAndView modelAndView = new ModelAndView();
        User  updateuser=userService.login(user.getPhone());
        int code=0;
        if(updateuser==null)
        {
             code = userService.updateToUser(user);
        }
        else if(updateuser.getId().equals(user.getId()))
        {
            code = userService.updateToUser(user);
        }
        else
        {
            code=2;
        }
        if (code == 0) {
            modelAndView.setViewName("userinfo");
            modelAndView.addObject("action", 1);
        } else if (code==1){
            modelAndView.setViewName("userinfo");
            modelAndView.addObject("action", 0);
        }
        else if(code==2)
        {
            modelAndView.setViewName("userinfo");
            modelAndView.addObject("action", 1);
        }
        modelAndView.addObject("flag",code);
        httpSession.setAttribute("user",user);
        return modelAndView;
    }
    //用户管理页面
    @RequestMapping("/usermanage")
    public ModelAndView userManage(String id)
    {
        ModelAndView modelAndView=new ModelAndView();
        //确认管理员身份
       if( userService.findOneUser(id).getAuthority()==3)
       {
           List<User> students=userService.findUserByAuthority(1);
           List<User> teachers=userService.findUserByAuthority(2);
           List<User> managers=userService.findUserByAuthority(3);
           modelAndView.addObject("students",students);
           modelAndView.addObject("teachers",teachers);
           modelAndView.addObject("managers",managers);
           modelAndView.setViewName("managetouser");
       }
       else
       {
           modelAndView.setViewName("index");
       }
        return modelAndView;
    }
    //管理员更新个人信息
    @RequestMapping("/updateuserbymanager")
    public ModelAndView updateUserinfo(User user)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("managetouser");
        int code=0;
        User user1=userService.findOneUser(user.getId());
        if(user1==null)
        {
            code=9;
        }
        else {
            if (user.getId() != null) {
                User updateuser = userService.login(user.getPhone());
                code = 0;
                if (updateuser == null) {
                    code = userService.updateToUser(user);
                } else if (updateuser.getId().equals(user.getId())) {
                    code = userService.updateToUser(user);
                } else {
                    code = 8;
                }
            }
        }
        List<User> students=userService.findUserByAuthority(1);
        List<User> teachers=userService.findUserByAuthority(2);
        List<User> managers=userService.findUserByAuthority(3);
        modelAndView.addObject("students",students);
        modelAndView.addObject("teachers",teachers);
        modelAndView.addObject("managers",managers);
        modelAndView.addObject("flag",code);
        return modelAndView;
    }
//管理员删除学生
    @RequestMapping("/deleteUserByManager")
    public ModelAndView deleteStudent(String id,String teacherid)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("managetouser");
        int code=0;
        User user=userService.findOneUser(id);
        if(user==null)
        {
            code=7;
        }
        else
        {
           if(user.getAuthority()==1)
           {
               progressinfoService.deleteStudentProgress(id);
               teacherscoreService.deleteStudentTeacherscore(id);
               stuscoreService.deleteStudentScore(id);
               List<Map<String,Object>> attended=activityService.findAttendedActivity(id);
               int i=0;
               for(i=0;i<attended.size();i++)
               {
                   activityService.updateaddleaveperson(attended.get(i).get("activityid").toString());
               }
               activitytouserService.deleteStudent(id);
               code=userService.deleteUser(id);
           }
           else if(user.getAuthority()==2)
           {
              User user1=userService.findOneUser(teacherid);
              if(user1==null)
              {
                  code=10;
              }
              else
              {
                 if(user1.getAuthority()!=2)
                 {
                     code=9;
                 }
                 else
                 {
                     if(teacherid.equals(id))
                     {
                         code=8;
                     }
                     else
                     {
                         activityService.updateStaffidBymanage(id,teacherid);
                         code=userService.deleteUser(id);
                     }
                 }
              }
           }
           else if (user.getAuthority()==3)
           {
               code=userService.deleteUser(id);
           }
        }
        modelAndView.addObject("flag",code+2);
        List<User> students=userService.findUserByAuthority(1);
        List<User> teachers=userService.findUserByAuthority(2);
        List<User> managers=userService.findUserByAuthority(3);
        modelAndView.addObject("students",students);
        modelAndView.addObject("teachers",teachers);
        modelAndView.addObject("managers",managers);
        return modelAndView;
    }
    //退出登录
    @RequestMapping("/logout")
    public ModelAndView logout(HttpSession httpSession)
    {
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.setViewName("index");
        httpSession.invalidate();
        return modelAndView;
    }
    //返回个人首页
    @RequestMapping("/goindex")
    public ModelAndView goIndex(String id,int authority)
    {
        ModelAndView modelAndView=new ModelAndView();
        if(authority==1)
        {
            modelAndView.setViewName("student");
            modelAndView.addObject("Activitylist",userService.findActivitiesAttended(id));
        }
        else if(authority==2)
        {
            modelAndView.setViewName("teacher");
            modelAndView.addObject("Activitylist",activityService.findActivityToTeacher(id));
        }
        else if(authority==3)
        {
            modelAndView.setViewName("manager");
        }
        return modelAndView;
    }



}
