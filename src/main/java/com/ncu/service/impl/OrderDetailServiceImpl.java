package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.OrderDetailMapper;
import com.ncu.po.OrderDetail;
import com.ncu.service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailServiceImpl extends BaseServiceImpl<OrderDetail> implements OrderDetailService {
    @Autowired
    private OrderDetailMapper orderDetailMapper;

    @Override
    public BaseDao<OrderDetail> getBaseDao() {
        return orderDetailMapper;
    }
}
