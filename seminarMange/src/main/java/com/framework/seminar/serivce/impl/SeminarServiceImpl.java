package com.framework.seminar.serivce.impl;

import com.framework.commons.exception.ServiceException;
import com.framework.seminar.mapper.SeminarMapper;
import com.framework.seminar.model.Seminar;
import com.framework.seminar.serivce.SeminarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SeminarServiceImpl implements SeminarService {
    @Autowired
    private SeminarMapper seminarMapper;

    @Override
    public List<Seminar> list() {
        return this.seminarMapper.list();
    }

    @Override
    public void saveOrUpdate(Seminar seminar) {
        try {
            if(seminar.getRoomId()!=null){
                this.seminarMapper.update(seminar);
            }else{
                this.seminarMapper.add(seminar);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServiceException("研讨室操作失败");
        }
    }

    @Override
    public int queryNameCount(String seminarName) {
        return this.seminarMapper.queryNameCount(seminarName);
    }

    @Override
    public Seminar load(int id) {
        return this.seminarMapper.load(id);
    }
}
