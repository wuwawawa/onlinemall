package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.UserMapper;
import com.ncu.po.User;
import com.ncu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public BaseDao<User> getBaseDao() {
        return userMapper;
    }
}
