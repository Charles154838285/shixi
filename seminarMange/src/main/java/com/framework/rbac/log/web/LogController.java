package com.framework.rbac.log.web;

import com.framework.commons.controller.BaseController;
import com.framework.commons.exception.ServiceException;
import com.framework.commons.model.R;
import com.framework.rbac.log.model.Log;
import com.framework.rbac.log.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * (sys_log)表控制层
 *
 * @author pangsir
 * @since 2020-08-07 13:07:26
 */
@Controller
@RequestMapping("/sys/log")
public class LogController extends BaseController {
	@Autowired
	private LogService logService;

	@GetMapping("/index")
	public String index(Model model) {
		return "log/index";
	}

	@GetMapping("/list")
	@ResponseBody
	public List<Log> list() {
		return this.logService.list();
	}


    @PostMapping("/delete")
    @ResponseBody
    public R add(@RequestParam("logs[]") String[] arr) {
        try {
            this.logService.delete(arr);
            return R.ok("删除记录成功，不可恢复");
        } catch (Exception e) {
			return R.error("删除记录失败");
        }
    }


}