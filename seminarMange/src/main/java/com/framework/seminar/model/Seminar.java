package com.framework.seminar.model;

import com.framework.bookInfo.model.BookInfo;
import lombok.Data;

@Data
public class Seminar {
    private Integer roomId;
    private String roomName;
    private String roomType;
    private Integer capacity;
    private Integer status;

    private BookInfo bookInfo;
}
