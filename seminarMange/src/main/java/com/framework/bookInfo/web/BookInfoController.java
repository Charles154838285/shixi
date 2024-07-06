package com.framework.bookInfo.web;

import com.framework.bookInfo.model.BookInfo;
import com.framework.bookInfo.service.BookInfoService;
import com.framework.commons.controller.BaseController;
import com.framework.commons.model.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sys/demo/info")
public class BookInfoController extends BaseController {
    @Autowired
    private BookInfoService bookInfoService;

    @GetMapping("/index")
    public String find(Page<BookInfo> page, Model model) {
        model.addAttribute("page", bookInfoService.find(page));
        return "book/find";
    }

    @GetMapping("/book")
    public String find1(Page<BookInfo> page, Model model) {
        model.addAttribute("page", bookInfoService.find(page));
        return "book/book";
    }
}
