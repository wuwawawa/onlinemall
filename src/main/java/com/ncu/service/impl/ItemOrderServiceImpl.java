package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.ItemOrderMapper;
import com.ncu.po.ItemOrder;
import com.ncu.service.ItemOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemOrderServiceImpl extends BaseServiceImpl<ItemOrder> implements ItemOrderService {

    @Autowired
    private ItemOrderMapper itemOrderMapper;

    @Override
    public BaseDao<ItemOrder> getBaseDao() {
        return itemOrderMapper;
    }
}
