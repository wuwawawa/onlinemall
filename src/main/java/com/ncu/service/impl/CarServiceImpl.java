package com.ncu.service.impl;

import com.ncu.base.BaseDao;
import com.ncu.base.BaseServiceImpl;
import com.ncu.mapper.CarMapper;
import com.ncu.po.Car;
import com.ncu.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl extends BaseServiceImpl<Car> implements CarService {

    @Autowired
    private CarMapper carMapper;

    @Override
    public BaseDao<Car> getBaseDao() {
        return carMapper;
    }
}
