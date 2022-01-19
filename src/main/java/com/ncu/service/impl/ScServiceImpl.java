package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.ScMapper;
import com.ncu.po.Sc;
import com.ncu.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScServiceImpl extends BaseServiceImpl<Sc> implements ScService {

    @Autowired
    private ScMapper scMapper;

    @Override
    public BaseDao<Sc> getBaseDao() {
        return scMapper;
    }
}
