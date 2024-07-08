package com.framework.seminar.serivce.impl;

import com.framework.bookInfo.model.BookInfo;
import com.framework.commons.exception.ServiceException;
import com.framework.seminar.mapper.SeminarMapper;
import com.framework.seminar.model.Seminar;
import com.framework.seminar.serivce.SeminarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
@Service
public class SeminarServiceImpl implements SeminarService {
    private static final Logger logger = LoggerFactory.getLogger(SeminarServiceImpl.class);
    @Autowired
    private SeminarMapper seminarMapper;

    @Override
    public List<Seminar> list() {
        return this.seminarMapper.list();
    }

    @Override
    public List<Seminar> alllist() {
        return this.seminarMapper.alllist();
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

    @Override
    public void delete(int id) {
        this.seminarMapper.delete(id);
    }


    @Override
    public void insertBook(BookInfo bookInfo) {
        try {
            logger.info("Inserting book info: {}", bookInfo);
            this.seminarMapper.insertBook(bookInfo);
            // 更新研讨室状态为已预约
            Seminar seminar = this.seminarMapper.load(bookInfo.getRoomId());
            if (seminar != null) {
                seminar.setStatus(2);
                this.seminarMapper.update(seminar);
                logger.info("Seminar updated with status 2: {}", seminar);
            } else {
                logger.error("Seminar not found with roomId: {}", bookInfo.getRoomId());
                throw new ServiceException("研讨室未找到");
            }
        } catch (Exception e) {
            logger.error("Error during booking: ", e);
            throw new ServiceException("预约失败");
        }
    }

    @Override
    public List<Seminar> searchRooms(String roomName, String roomType, Integer status) {
            return this.seminarMapper.searchRooms(roomName,roomType,status);
    }


}
