package com.framework.seminar.mapper;

import com.framework.bookInfo.model.BookInfo;
import com.framework.seminar.model.Seminar;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SeminarMapper {
    List<Seminar> list();

    List<Seminar> alllist();
    void add(Seminar seminar);

    void update(Seminar seminar);

    int queryNameCount(String roomName);

    Seminar load(int id);

    void delete(int id);

    void insertBook(BookInfo bookInfo);
}
