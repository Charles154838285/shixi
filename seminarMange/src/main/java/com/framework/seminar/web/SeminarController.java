package com.framework.seminar.web;

import com.framework.bookInfo.model.BookInfo;
import com.framework.commons.model.Page;
import com.framework.commons.model.R;
import com.framework.seminar.model.Seminar;
import com.framework.seminar.serivce.SeminarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sys/demo/seminar")
public class SeminarController {
    @Autowired
    private SeminarService seminarService;

    @GetMapping("/index")
    public String toRoomView(Model model) {
        model.addAttribute("toRoomList",this.seminarService.list());
//        SessionUser sessionUser = (SessionUser) session.getAttribute("session_user");
//        System.out.println(sessionUser);
        return "seminar/list";
    }

    @GetMapping("/add")
    public String add(){
        return "seminar/add";
    }

    @GetMapping("/book")
    public String toRoomView1(Model model) {
        model.addAttribute("toRoomList",this.seminarService.list());
//        SessionUser sessionUser = (SessionUser) session.getAttribute("session_user");
//        System.out.println(sessionUser);
        return "seminar/book";
    }
    @PostMapping({"/add","/update"})
    @ResponseBody
    public R add(@RequestBody Seminar seminar){
        try {
            this.seminarService.saveOrUpdate(seminar);
            return R.ok("操作成功");
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }
    @PostMapping("/delete/{id}")
    @ResponseBody
    public R delete(@PathVariable("id") int id)
    { try
        { this.seminarService.delete(id);
            return R.ok("操作成功");
        } catch (Exception e)
     { return R.error(e.getMessage()); }
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable Integer id ,Model model){
        model.addAttribute("Room",this.seminarService.load(id));
        return "seminar/update";
    }

    @GetMapping("/book/{id}")
    public String bookTime(@PathVariable("id") Integer id,Model model){
        model.addAttribute("Seminar",this.seminarService.load(id));
        return "seminar/booktime";
    }

    @PostMapping("/book")
    @ResponseBody
    public R booktime(@RequestBody BookInfo bookInfo) {
        try {
            // 插入预约记录
            this.seminarService.insertBook(bookInfo);

            // 更新研讨室状态为已预约
            Seminar seminar = this.seminarService.load(bookInfo.getRoomId());
            seminar.setStatus(2);
            this.seminarService.saveOrUpdate(seminar);

            return R.ok("操作成功");
        } catch (Exception e) {
            return R.error(e.getMessage());
        }
    }
    @PostMapping("/query/name")
    @ResponseBody
    public Boolean queryNameCount(String name,String oldName){
        if(oldName!=null){
            if(name.equals(oldName)){
                return true;
            }else{
                return this.seminarService.queryNameCount(name) == 0;
            }
        }else{
            return this.seminarService.queryNameCount(name) == 0;
        }
    }
}

