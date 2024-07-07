package com.framework.bookInfo.model;

import com.framework.seminar.model.Seminar;
import lombok.Data;

import java.util.Date;

@Data
public class BookInfo {
    private Integer bookId;
    private String username;
    private String account;
    private Integer roomId;
    private Date startDate;
    private Date endDate;
    private Integer status;

    //获取研讨室类型的对象信息
    private Seminar seminar;
}
