package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.PostMapper;
import com.ncu.po.Post;
import com.ncu.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author LMY
 * @version 1.0 2020/12/16
 */
@Service
public class PostServiceImpl extends BaseServiceImpl<Post> implements PostService {

    @Autowired
    private PostMapper postMapper;

    @Override
    public BaseDao<Post> getBaseDao() {
        return postMapper;
    }
}
