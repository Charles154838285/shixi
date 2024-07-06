package com.framework.bookInfo.service.Impl;

import com.framework.bookInfo.mapper.BookInfoMapper;
import com.framework.bookInfo.model.BookInfo;
import com.framework.bookInfo.service.BookInfoService;
import com.framework.commons.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BookInfoServiceImpl implements BookInfoService {
    @Autowired
    private BookInfoMapper bookInfoMapper;

    @Override
    public Page<BookInfo> find(Page<BookInfo> page) {
        //存储查询的结果集
        page.setDatas(this.bookInfoMapper.list(page));
        //存储查询的结果数量
        page.setTotalCount(this.bookInfoMapper.totalCount(page));
        return page;
    }
}
