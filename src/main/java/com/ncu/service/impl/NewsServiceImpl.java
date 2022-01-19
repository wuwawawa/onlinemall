package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.NewsMapper;
import com.ncu.po.News;
import com.ncu.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsServiceImpl extends BaseServiceImpl<News> implements NewsService {

    @Autowired
    private NewsMapper newsMapper;

    @Override
    public BaseDao<News> getBaseDao() {
        return newsMapper;
    }
}
