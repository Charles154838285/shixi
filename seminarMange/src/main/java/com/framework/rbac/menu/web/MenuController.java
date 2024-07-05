package com.framework.rbac.menu.web;

import com.framework.commons.controller.BaseController;
import com.framework.commons.exception.ServiceException;
import com.framework.commons.model.R;
import com.framework.rbac.menu.model.Menu;
import com.framework.rbac.menu.model.MenuNode;
import com.framework.rbac.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * (sys_menu)表控制层
 *
 * @author pangsir
 * @since 2020-07-31 15:19:54
 */
@Controller
@RequestMapping("/sys/menu")
public class MenuController extends BaseController {
	@Autowired
	private MenuService menuService;

	@GetMapping("/index")
	public String index(Model model) {
		return "menu/index";
	}

	@GetMapping("/list")
	@ResponseBody
	public List<MenuNode> list() {
		return menuService.geTreeParentNodeList();
	}

	@GetMapping("/add/{parentId}")
	public String add(@PathVariable Integer parentId,Model model) {
		if(parentId!=-1){
			model.addAttribute("parentMenuList",this.menuService.getParentMenuList());
		}
		model.addAttribute("parentId",parentId);
		return "menu/add";
	}
	@PostMapping("/add")
	public String add(Menu menu, Model model) {
		try {
			this.menuService.add(menu);
			model.addAttribute("message","新建节点成功");
		} catch (ServiceException e) {
			model.addAttribute("message",e.getMessage());
		}
		model.addAttribute("url","sys/menu/add/"+(menu.getParentId()==null?-1:menu.getParentId()));
		return "menu_message";
	}

	@GetMapping("/update/{id}")
	public String update(@PathVariable("id") Integer id, Model model) {
		Menu menu = this.menuService.load(id);
		if(menu.getParentId()!=null){
			model.addAttribute("parentMenuList",this.menuService.getParentMenuList());
		}
		model.addAttribute("menu",menu);
		return "menu/update";
	}

	@PostMapping("/update")
	public String update(Menu menu, Model model) {
		try {
			this.menuService.update(menu);
			model.addAttribute("message","更新节点成功");
		} catch (ServiceException e) {
			model.addAttribute("message",e.getMessage());
		}
		model.addAttribute("url","sys/menu/update/"+menu.getMenuId());
		return "menu_message";
	}

    @PostMapping("/delete/{id}")
    @ResponseBody
    public R delete(@PathVariable("id") Integer id) {
        try {
            this.menuService.delete(id);
            return R.ok("删除节点成功");
        } catch (ServiceException e) {
			return R.error(e.getMessage());
        }
    }


}