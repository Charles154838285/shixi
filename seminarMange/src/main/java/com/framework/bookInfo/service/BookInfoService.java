package com.framework.bookInfo.service;

import com.framework.bookInfo.model.BookInfo;
import com.framework.commons.model.Page;

public interface BookInfoService {

    Page<BookInfo> find(Page<BookInfo> page);
}
