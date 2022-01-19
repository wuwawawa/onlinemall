package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.ReplyMapper;
import com.ncu.po.Reply;
import com.ncu.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author LMY
 * @version 1.0 2020/12/16
 */
@Service
public class ReplyServiceImpl extends BaseServiceImpl<Reply> implements ReplyService {

    @Autowired
    private ReplyMapper replyMapper;

    @Override
    public BaseDao<Reply> getBaseDao() {
        return replyMapper;
    }
}
