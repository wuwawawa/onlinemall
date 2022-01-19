package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.ManageMapper;
import com.ncu.po.Manage;
import com.ncu.service.ManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManageServiceImpl extends BaseServiceImpl<Manage> implements ManageService {
    @Autowired
    ManageMapper manageMapper;

    @Override
    public BaseDao<Manage> getBaseDao() {
        return manageMapper;
    }
}
