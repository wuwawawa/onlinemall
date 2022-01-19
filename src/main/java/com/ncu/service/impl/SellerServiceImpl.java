package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.SellerMapper;
import com.ncu.po.Seller;
import com.ncu.service.SellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerServiceImpl extends BaseServiceImpl<Seller> implements SellerService {
    @Autowired
    private SellerMapper sellerMapper;

    @Override
    public BaseDao<Seller> getBaseDao() {
        return sellerMapper;
    }

}
