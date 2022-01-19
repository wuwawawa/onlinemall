package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.ItemMapper;
import com.ncu.po.Item;
import com.ncu.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemServiceImpl extends BaseServiceImpl<Item> implements ItemService {

    @Autowired
    private ItemMapper itemMapper;
    @Override
    public BaseDao<Item> getBaseDao() {
        return itemMapper;
    }
}
