package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.ItemCategoryMapper;
import com.ncu.po.ItemCategory;
import com.ncu.service.ItemCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ItemCategoryServiceImpl extends BaseServiceImpl<ItemCategory> implements ItemCategoryService {
    @Autowired
    ItemCategoryMapper itemCategoryMapper;

    @Override
    public BaseDao<ItemCategory> getBaseDao() {
        return itemCategoryMapper;
    }
}
