package com.framework.seminar.serivce;

import com.framework.seminar.model.Seminar;

import java.util.List;

public interface SeminarService {
    List<Seminar> list();
    void saveOrUpdate(Seminar course);
    int queryNameCount(String name);
    Seminar load(int id);
}
