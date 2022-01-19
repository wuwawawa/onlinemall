package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.CommentMapper;
import com.ncu.po.Comment;
import com.ncu.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentServiceImpl extends BaseServiceImpl<Comment> implements CommentService {

    @Autowired
    private CommentMapper commentMapper;

    @Override
    public BaseDao<Comment> getBaseDao() {
        return commentMapper;
    }
}
