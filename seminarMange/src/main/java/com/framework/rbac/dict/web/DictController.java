package com.framework.rbac.dict.web;

import com.framework.commons.controller.BaseController;
import com.framework.commons.exception.ServiceException;
import com.framework.commons.model.R;
import com.framework.rbac.dict.model.Dict;
import com.framework.rbac.dict.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * (sys_dict)表控制层
 *
 * @author pangsir
 * @since 2020-08-08 13:06:31
 */
@Controller
@RequestMapping("/sys/dict")
public class DictController extends BaseController {
	@Autowired
	private DictService dictService;

	@GetMapping("/index")
	public String index(Model model) {
		return "dict/index";
	}

	@GetMapping("/list")
	@ResponseBody
	public Map<String,Object> list(String order, Integer offset, Integer limit) {
		return this.dictService.find(order,offset,limit);
	}

	@GetMapping("/add")
	public String add() {
		return "dict/add";
	}

	@PostMapping("/add")
	public String add(Dict dict, Model model) {
		try {
			this.dictService.add(dict);
			model.addAttribute("message","新建字典成功");
		} catch (Exception e) {
			model.addAttribute("message","新建字典失败");
		}
		return "dict_message";
	}

	@GetMapping("/update/{id}")
	public String update(@PathVariable("id") String id, Model model) {
		model.addAttribute("dict", this.dictService.load(id));
		return "dict/update";
	}

	@PostMapping("/update")
	public String update(Dict dict, Model model) {
		try {
			this.dictService.update(dict);
			model.addAttribute("message","更新字典成功");
		} catch (Exception e) {
			model.addAttribute("message","更新字典失败");
		}
		return "dict_message";
	}

    @GetMapping("/delete/{id}")
    @ResponseBody
    public R delete(@PathVariable("id") String id) {
		try {
			this.dictService.delete(id);
			return R.ok("删除字典成功");
		} catch (Exception e) {
			return R.error("删除字典失败");
		}
    }


}