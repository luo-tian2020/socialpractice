package com.luotian.Service.Impl;

import com.luotian.Entity.Activity;
import com.luotian.Entity.User;
import com.luotian.Mapper.UserMapper;
import com.luotian.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;
    @Override
    public User findOneUser(String id) {
       if(id!=null)
       {
           return userMapper.findOneUser(id);
       }
       return null;
    }

    @Override
    public int updateToUser(User user) {
       if(userMapper.findOneUser(user.getId())==null)
       {
           return userMapper.addUser(user);
       }
       return userMapper.updateUser(user);
    }

    @Override
    public int deleteUser(String id) {
        if(id!=null)
        {
            if(userMapper.findOneUser(id)!=null)
            {
                return userMapper.deleteUser(id);
            }
            return 1;
        }
        return -1;
    }

    @Override
    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

    @Override
    public User login(String phone) {
        return userMapper.login(phone);
    }

    @Override
    public List<Activity> findActivitiesAttended(String id) {
       if(id==null && id=="")
       {
           return null;
       }
       return userMapper.findActivitiesAttended(id);
    }

    @Override
    public List<User> findUserByAuthority(int authority) {
       return userMapper.findUserByAuthority(authority);
    }
}
