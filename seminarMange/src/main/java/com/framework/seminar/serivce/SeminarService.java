package com.framework.seminar.serivce;

import com.framework.bookInfo.model.BookInfo;
import com.framework.seminar.model.Seminar;

import java.util.List;

public interface SeminarService {
    List<Seminar> list();
    List<Seminar> alllist();
    void saveOrUpdate(Seminar course);
    int queryNameCount(String name);
    Seminar load(int id);
    void delete(int id);
    void insertBook(BookInfo bookInfo);
}
