package com.luotian.Service;

import com.luotian.Entity.Activity;
import com.luotian.Entity.User;

import java.util.List;

public interface UserService {
    //查询个人信息
    public User findOneUser(String id);
    //添加或更新个人信息
    public int updateToUser(User user);
    //删除个人信息
    public int deleteUser(String id);
    //查询所有用户信息
    public List<User> findAllUser();
    //根据手机号登录
    public User login(String phone);
    //查询学生已参加的活动
    public List<Activity> findActivitiesAttended(String id);
    //根据authority进行查询
    public List<User> findUserByAuthority(int authority);

}
