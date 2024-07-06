package com.framework.bookInfo.mapper;

import com.framework.bookInfo.model.BookInfo;
import com.framework.commons.model.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookInfoMapper {

    List<BookInfo> list(Page<BookInfo> page);

    int totalCount(Page<BookInfo> page);
}
