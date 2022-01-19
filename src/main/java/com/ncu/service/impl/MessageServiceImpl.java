package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.MessageMapper;
import com.ncu.po.Message;
import com.ncu.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Override
    public BaseDao<Message> getBaseDao() {
        return messageMapper;
    }
}
