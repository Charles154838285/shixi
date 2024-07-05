package com.framework.rbac.role.web;

import com.framework.commons.controller.BaseController;
import com.framework.commons.exception.ServiceException;
import com.framework.commons.model.R;
import com.framework.rbac.menu.service.MenuService;
import com.framework.rbac.role.model.Role;
import com.framework.rbac.role.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (sys_role)表控制层
 *
 * @author pangsir
 * @since 2020-08-01 13:06:30
 */
@Controller
@RequestMapping("/sys/role")
public class RoleController extends BaseController {
	@Autowired
	private RoleService roleService;
	@Autowired
	private MenuService menuService;

	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("roleList", this.roleService.list());
		return "role/list";
	}
	/**测试角色列表返回JSON数据**/
	@GetMapping("/json/list")
	@ResponseBody
	@CrossOrigin
	public Map<String,Object> list() {

		Map<String,Object> resultMap = new HashMap<>();

		resultMap.put("data",this.roleService.list());
		return resultMap;
	}

	@GetMapping("/add")
	public String add() {
		return "role/add";
	}
	@GetMapping("/valid/key")
	public @ResponseBody boolean validRoleKey(String roleKey){
		if(this.roleService.getRoleKeyCount(roleKey)==1){
			return false;
		}else{
			return true;
		}
	}

	@PostMapping("/add")
	@ResponseBody
	public R add(@RequestBody Role role) {
		try {
			this.roleService.add(role);
			return R.ok("新建系统角色成功");
		} catch (ServiceException e) {
			return R.error(e.getMessage());
		}
	}

	@GetMapping("/update/{id}")
	public String update(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("role", this.roleService.load(id));
		return "role/update";
	}

	@PostMapping("/update")
	@ResponseBody
	public R update(@RequestBody Role role) {
		try {
			this.roleService.update(role);
			return R.ok("更新系统角色成功");
		} catch (ServiceException e) {
			return R.error(e.getMessage());
		}
	}

	@GetMapping("/update/permission/{id}")
	public String updatePermission(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("role", this.roleService.load(id));
		model.addAttribute("selectedMenuList", this.menuService.getSelectedMenuList(id));
		model.addAttribute("unSelectedMenuList", this.menuService.getUnSelectedMenuList(id));
		return "role/permission";
	}

	@PostMapping("/update/permission")
	public String updatePermission(Integer roleId,Integer[] menus, Model model) {
		try {
			this.roleService.updatePermission(roleId,menus);
			model.addAttribute("R", R.ok("角色授权菜单成功"));
			model.addAttribute("url", "sys/role/list");
		} catch (ServiceException e) {
			model.addAttribute("R", R.error(e.getMessage()));
			model.addAttribute("url", "sys/role/update/permission/"+roleId);
		}
		return "tip";
	}

	@GetMapping("/delete/{id}")
	@ResponseBody
	public R delete(@PathVariable("id") Integer id) {
		try {
			this.roleService.delete(id);
			return R.ok("注销角色成功");
		} catch (Exception e) {
			return R.error("注销角色失败");
		}
	}


}